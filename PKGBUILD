# Maintainer: Leonid Pilyugin  <l.pilyugin04@gmail.com>

pkgname=kawaii-oh-my-zsh
pkgver=1.7
pkgrel=1
pkgdesc='Framework for kawaii zsh configuration.'
url='https://github.com/LeonidPilyugin/kawaii-oh-my-zsh'
groups=(kawaii)
arch=(x86_64)
depends=('oh-my-zsh-git')
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/LeonidPilyugin/$pkgname/releases/download/v$pkgver/files.tar.gz")
sha256sums=('992f6ee73498920611f524ffcd734847098b107095cae8abc737ec464b2af08b')

package() {
    dir=$pkgdir/usr/share/oh-my-zsh/themes
    install -dm755 $dir
    cp $srcdir/files/* $dir/
}
