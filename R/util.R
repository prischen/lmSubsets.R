## Copyright  2009-2020  Marc Hofmann and Achim Zeileis
##
## This file is part of the 'lmSubsets' R extension.
##
## 'lmSubsets' is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## 'lmSubsets' is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with 'lmSubsets'.  If not, see <http://www.gnu.org/licenses/>.



parent.env <- function (env = parent.frame()) {
    base::parent.env(env)
}


pix2usr <- function (x, y, carry) {
    if (!missing(x)) {
        if (!missing(y))  warning ("unused argument 'y' will be discarded")

        ans <- grconvertX(x, "device", "user") - grconvertX(0, "device", "user")
        if (!missing(carry))  ans <- carry_sign(carry, x, ans)
    } else if (!missing(y)) {
        ans <- grconvertY(y, "device", "user") - grconvertY(0, "device", "user")
        if (!missing(carry))  ans <- carry_sign(carry, y, ans)
    } else {
        stop ("please specify 'x' or 'y'")
    }

    ans
}


carry_sign <- function (carry, a, b) {
    if (carry > 0) {
        sign(a) * abs(b)
    } else if (carry < 0) {
        -sign(a) * abs(b)
    } else {
        abs(b)
    }
}
