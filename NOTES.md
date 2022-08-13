## Useful info about VIM 8 plugin system (new pathogen)
<https://shapeshed.com/vim-packages/>

## VIM-GO
The command to updated vim-go required binaries is `:GoUpdateBinaries`.
On first installation (just after go submodule add ...) enter in vim and type: `:GoInstallBinaries`.

## YCM
### Installaton
``` bash
git submodule add https://github.com/ycm-core/YouCompleteMe.git pack/plug/start/YouCompleteMe
cd pack/plug/start/YouCompleteMe/
python3 install.py --clang-completer --go-completer --ts-completer
```

## PGSQL
Use `let g:sql_type_default = 'pgsql'` in .vimrc to set PostgreSQL as default SQL file syntax.
Alternatively, after loading a .sql file use this command to change syntax on the fly:
`:SQLSetType pgsql.vim`
To set the file type in new buffer use:
`:let b:sql_type_override='pgsql' | set ft=sql`

[Fix for YCM (gocode post, should be the last one)](https://github.com/Valloric/YouCompleteMe/issues/3074)

### Upgrade
Enter into YouCompleteMe and run:
``` bash
git submodule update --init --recursive --force
git submodule sync --recursive
```
