# ubuntu-dev-docker
C/C++/Rust Development Environment on Ubuntu

## Preindstalled packages

- wget
- zsh
- font-powerline
- oh-my-zsh
- zsh config
- add devuser
- nvim (0.6.0)
- nvim config
- llvm
- clangd
- rust
- rust-analyzer
- build-essential
- gdb
- lldb
- ripgrep
- tmux
- bear
- compdb
- nvm
- node
- 

## Neovim configuration

- LSP settings
  * clangd for C/C++ development
  * rust-tools for Rust devlopment
- Vimspctor
  * The debug setting is project orinted, place a .vimspector.json file under project folder
  * .vimspector.json for c project
  
  ```json
  {
    "configurations": {
        "lldb": {
            "adapter": "CodeLLDB",
            "configuration": {
                "name": "Launch",
                "type": "lldb",
                "request": "launch",
                "program": "${Executable}",
                "args": ["*${Args}"],
                "sourceLanguages": ["c"]
            },
            "breakpoints": {
                "exception": {
                    "cpp_throw": "Y",
                    "cpp_catch": "N"
                }
            }
        }
     }
  }
  ```
  * .vimspector.json for rust project
  
  ```json
  {
    "configurations": {
        "lldb": {
            "adapter": "CodeLLDB",
            "configuration": {
                "name": "Launch",
                "type": "lldb",
                "request": "launch",
                "program": "${Executable}",
                "args": ["*${Args}"],
                "sourceLanguages": ["rust"]
            },
            "breakpoints": {
                "exception": {
                    "cpp_throw": "Y",
                    "cpp_catch": "N"
                }
            }
        }
    }
  }
  ```
  
- clangd setting
  * Under each project folder, there should be a compile_commands.json which configure the compile parameters for each .c and .h file.
  * Auto generate the compile_command.json by the following script
   
  ```bash
  > bear -- make
  > compdb -p ./ list > compile_commands.compdb.json
  > mv compile_commands.compdb.json compile_commands.json
  ```   
  
  * In case of some project header files are not self contained, that makes compile error from clangd, for purpose of removing the those errors, you can add the default header files to ~/.config/clangd/config.yaml
  
  ```yaml
  If:                               # Apply this config conditionally
    PathMatch: .*\.*                # to all headers and c files...
  CompileFlags:                     # Tweak the parse settings
    Add: [-include postgres.h, -include c.h, -include relcache.h]

  ```
  
   
  


