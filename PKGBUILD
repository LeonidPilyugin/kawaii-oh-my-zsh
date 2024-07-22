# Maintainer: Leonid Pilyugin  <l.pilyugin04@gmail.com>

pkgname=kawaii-oh-my-zsh
pkgver=1.6
pkgrel=1
pkgdesc='Framework for kawaii zsh configuration.'
url='https://github.com/LeonidPilyugin/kawaii-oh-my-zsh'
groups=(kawaii)
arch=(x86_64)
depends=('oh-my-zsh-git')
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/LeonidPilyugin/$pkgname/releases/download/v$pkgver/files.tar.gz")
sha256sums=('60f2d6aaa55dd13be415fd3ec55088c0c496d1aa8ef1150ff7acf924fd0c47c1')

package() {
    dir=$pkgdir/usr/share/oh-my-zsh/themes
    install -dm755 $dir
    cp $srcdir/files/* $dir/
}
