# Maintainer: @zstg <zestig@duck.com>
pkgname=stratos-wallpapers
pkgver=1.0
pkgrel=1
pkgdesc="StratOS wallpapers"
arch=('any')
license=('GPL3')
depends=()
source=()
md5sums=('SKIP')
install=stratos-wallpapers.install
prepare() {
    cp -r "$startdir/usr" "$srcdir/"
}
package() {
    install -d "$pkgdir/usr/share/backgrounds/StratOS/"
    cp -a "$srcdir/backgrounds/StratOS/." "$pkgdir/usr/share/backgrounds/StratOS/"
}