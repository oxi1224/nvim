local status_ok, jdtls = pcall(require, "jdtls")
if not status_ok then
  print("Failed to require jdtls")
  return
end

local data_path = vim.fn.stdpath("data")
local jdtls_path = data_path .. "/mason/packages/jdtls"
local workspace_path = data_path .. "/mason/share/jdtls/workspaces";

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = workspace_path .. project_name

local lombok_path = jdtls_path .. "/lombok.jar"
local launcher_path = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
local config_path = jdtls_path .. "/config_win"

local config = {
  cmd = {
    'java', -- VERY important
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dosgi.checkConfiguration=true',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xmx1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    '-javaagent:' .. lombok_path,  -- important 
    '-jar', launcher_path,         -- important 
    '-configuration', config_path, -- important
    '-data', workspace_dir
  },
  root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew', 'build.gradle', 'pom.xml'}),
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
require('jdtls').start_or_attach(config)
