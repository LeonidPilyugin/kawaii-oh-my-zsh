# Maintainer: Leonid Pilyugin  <l.pilyugin04@gmail.com>

pkgname=kawaii-oh-my-zsh
pkgver=1.1
pkgrel=1
pkgdesc='Framework for kawaii zsh configuration.'
arch=('x86_64')
depends=('oh-my-zsh-git')
groups=('kawaii')
url="https://github.com/ohmyzsh/ohmyzsh"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/LeonidPilyugin/$pkgname/releases/download/v$pkgver/files.tar.gz")
sha256sums=('23f470fb384d62075d60c60cfc163aafde9efb41d9980166bf7e2fe803fbe17a')

package() {
    cp $srcdir/files/* $pkgdir/usr/share/oh-my-zsh/themes/
}
