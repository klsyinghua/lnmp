Import-Module downloader
Import-Module unzip

Function install($VERSION="1.36.0",$preVersion=0){
  if($preVersion){

  }
  $url="https://vscode.cdn.azure.cn/stable/0f3794b38477eea13fb47fbe15a42798e6129338/VSCodeUserSetup-x64-1.36.0.exe"
  $name="VSCode"
  $filename="VSCodeUserSetup-x64-${VERSION}.exe"
  $unzipDesc="vscode"

  if($(_command code)){
    $CURRENT_VERSION=(code --version)[0]

    if ($CURRENT_VERSION -eq $VERSION){
        echo "==> $name $VERSION already install"
        return
    }
  }

  # 下载原始 zip 文件，若存在则不再进行下载
  _downloader `
    $url `
    $filename `
    $name `
    $VERSION

  # 验证原始 zip 文件 Fix me

  # 解压 zip 文件 Fix me
  # _unzip $filename $unzipDesc
  # 安装 Fix me
  # Copy-item "" ""

  Start-Process -FilePath $filename -wait

  echo "==> Checking ${name} ${VERSION} install ..."
  # 验证 Fix me
  code --version
}

Function uninstall(){
  echo ""
  # Remove-item
}
