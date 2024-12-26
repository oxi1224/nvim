local status_ok, jdtls = pcall(require, "jdtls")
if not status_ok then
  print("Failed to require jdtls")
  return
end

local data_path = vim.fn.stdpath("data")
local jdtls_path = data_path .. "/mason/packages/jdtls"
local workspace_path = data_path .. "/mason/share/jdtls/workspaces";

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = workspace_path .. "/" .. project_name
workspace_dir = workspace_dir:gsub("\\", "/")

local lombok_path = jdtls_path .. "/lombok.jar"
local launcher_path = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
local config_path = jdtls_path .. "/config_win"

-- Make jdtls properly handle network paths
local function to_file_uri(path)
  path = path:gsub("\\", "/")
  if not path:match("^//") then
    return "file:///" .. path
  else
    return "file:" .. path
  end
end
local root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew', 'build.gradle', 'pom.xml'})
if not root_dir then
  root_dir = vim.fn.getcwd()
end
root_dir = to_file_uri(root_dir)

local config = {
  cmd = {
    'java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dosgi.checkConfiguration=true',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xmx2g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    '-javaagent:' .. lombok_path,
    '-jar', launcher_path,
    '-configuration', config_path,
    '-data', workspace_dir
  },
  root_dir = root_dir,
  settings = {
    java = {
      eclipse = {
        downloadSources = true,
      },
      maven = {
        downloadSources = true,
      },
      implementationsCodeLens = {
        enabled = true,
      },
      referencesCodeLens = {
        enabled = true,
      },
      references = {
        includeDecompiledSources = true,
      },
      saveActions = {
        organizeImports = true
      },
      inlayHints = {
        parameterNames = {
          enabled = "all", -- literals, all, none
        },
      },
      format = {
        enabled = false,
      },
    },
    capabilities = {
      workspace = {
        configuration = true,
      },
      textDocument = {
        completion = {
          completionItem = {
            snippetSupport = true,
          }
        }
      }
    },
    signatureHelp = { enabled = true },
    extendedClientCapabilities = jdtls.extendedClientCapabilities,
  },
  init_options = {
    bundles = {}
  },
}
config.capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Disable jdtls from overriding treesitter highlight groups
config.on_attach = function (client, bufnr)
  client.server_capabilities.semanticTokensProvider = nil
end
require('jdtls').start_or_attach(config)
