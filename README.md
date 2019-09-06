## Useful info about VIM 8 plugin system (new pathogen)
<https://shapeshed.com/vim-packages/>

## VIM-GO
The command to updated vim-go required binaries is `:GoUpdateBinaries`.
On first installation (just after go submodule add ...) enter in vim and type: `:GoInstallBinaries`.

## YCM
[Fix for YCM (gocode post, should be the last one)](https://github.com/Valloric/YouCompleteMe/issues/3074)

### Go upgrade
To fix YCM after upgrading Go:
``` bash
cd ~/.vim/pack/plug/start/youcompleteme/third_party/ycmd/third_party/go
pushd src/github.com/mdempsky/gocode
GOPATH=$(realpath ../../../..) go build
popd
pushd src/github.com/rogpeppe/godef
GOPATH=$(realpath ../../../..) go build
popd
```
