# Maintainer: @zstg <zestig@duck.com>
pkgname=stratos-wallpapers
pkgver=1.0
pkgrel=1
pkgdesc="StratOS wallpapers"
arch=('any')
license=('GPL3')
depends=()
source=("backgrounds/")
md5sums=('SKIP')

package() {
    install -d "$pkgdir/usr/share/backgrounds/StratOS/"
    cp -a "$srcdir/backgrounds/StratOS/." "$pkgdir/usr/share/backgrounds/StratOS/"
}