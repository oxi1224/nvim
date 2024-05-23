local status_ok, jdtls = pcall(require, "jdtls")
if not status_ok then
  print("Failed to require jdtls")
  return
end

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_path = "C:\\Users\\oxi12\\AppData\\Local\\nvim-data\\mason\\share\\jdtls\\workspaces";
local workspace_dir = workspace_path .. project_name
local extendedClientCapabilities = jdtls.extendedClientCapabilities

local config = {
  cmd = {
    -- 💀
    'java', -- or '/path/to/java17_or_newer/bin/java'
            -- depends on if `java` is in your $PATH env variable and if it points to the right version.
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
    '-javaagent:C:\\Users\\oxi12\\AppData\\Local\\nvim-data\\mason\\share\\lombok-nightly\\lombok.jar',
    -- 💀
    '-jar', 'C:\\Users\\oxi12\\AppData\\Local\\nvim-data\\mason\\packages\\jdtls\\plugins\\org.eclipse.equinox.launcher_1.6.800.v20240330-1250.jar',
    -- 💀
    '-configuration', 'C:\\Users\\oxi12\\AppData\\Local\\nvim-data\\mason\\packages\\jdtls\\config_win',
    -- 💀
    -- See `data directory configuration` section in the README
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
    extendedClientCapabilities = extendedClientCapabilities,
  },
  init_options = {
    bundles = {}
  },
}
config.capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
require('jdtls').start_or_attach(config)
