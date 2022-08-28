# Maintainer: Leonid Pilyugin  <l.pilyugin04@gmail.com>

pkgname=kawaii-oh-my-zsh
pkgver=1.3
pkgrel=1
pkgdesc='Framework for kawaii zsh configuration.'
url='https://github.com/LeonidPilyugin/kawaii-oh-my-zsh'
groups=(kawaii)
arch=(x86_64)
depends=('oh-my-zsh-git')
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/LeonidPilyugin/$pkgname/releases/download/v$pkgver/files.tar.gz")
sha256sums=('a5e2bb867851a21c16385a5eff7135b42edec9378718d33630fa77382d7a4890')

package() {
    dir=$pkgdir/usr/share/oh-my-zsh/themes
    install -dm755 $dir
    cp $srcdir/files/* $dir/
}
