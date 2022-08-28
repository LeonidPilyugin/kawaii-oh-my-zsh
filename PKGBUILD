# Maintainer: Leonid Pilyugin  <l.pilyugin04@gmail.com>

pkgname=kawaii-oh-my-zsh
pkgver=1.2
pkgrel=1
pkgdesc='Framework for kawaii zsh configuration.'
url='https://github.com/LeonidPilyugin/kawaii-oh-my-zsh'
groups=(kawaii)
arch=(x86_64)
depends=('oh-my-zsh-git')
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/LeonidPilyugin/$pkgname/releases/download/v$pkgver/files.tar.gz")
sha256sums=('1560c2f7feee32ce926043f0024919f6136b6846711a008db7563ab44a3f96bb')

package() {
    dir=$pkgdir/usr/share/oh-my-zsh/themes
    install -dm755 $dir
    cp $srcdir/files/* $dir/
}
