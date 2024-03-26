# Maintainer: Leonid Pilyugin  <l.pilyugin04@gmail.com>

pkgname=kawaii-oh-my-zsh
pkgver=1.5
pkgrel=1
pkgdesc='Framework for kawaii zsh configuration.'
url='https://github.com/LeonidPilyugin/kawaii-oh-my-zsh'
groups=(kawaii)
arch=(x86_64)
depends=('oh-my-zsh-git')
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/LeonidPilyugin/$pkgname/releases/download/v$pkgver/files.tar.gz")
sha256sums=('d6946385a953393a2245350f4d469abf0da4f0b68fc6bedb2463b8314dd02fcf')

package() {
    dir=$pkgdir/usr/share/oh-my-zsh/themes
    install -dm755 $dir
    cp $srcdir/files/* $dir/
}
