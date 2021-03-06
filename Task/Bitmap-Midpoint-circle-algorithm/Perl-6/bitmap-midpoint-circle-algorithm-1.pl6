use MONKEY-TYPING;

class Pixel { has UInt ($.R, $.G, $.B) }
class Bitmap {
    has UInt ($.width, $.height);
    has Pixel @!data;

    method fill(Pixel $p) {
        @!data = $p.clone xx ($!width*$!height)
    }
    method pixel(
	$i where ^$!width,
	$j where ^$!height
	--> Pixel
    ) is rw { @!data[$i + $j * $!width] }

    method set-pixel ($i, $j, Pixel $p) {
	self.pixel($i, $j) = $p.clone;
    }
    method get-pixel ($i, $j) returns Pixel {
	self.pixel($i, $j);
    }
}

augment class Pixel { method Str { "$.R $.G $.B" } }
augment class Bitmap {
    method P3 {
        join "\n", «P3 "$.width $.height" 255»,
        do for ^$.height { join ' ', @.data[]»[$_] }
    }
    method raster-circle ( $x0, $y0, $r, Pixel $value ) {
        my $f = 1 - $r;
        my $ddF_x = 0;
        my $ddF_y = -2 * $r;
        my ($x, $y) = 0, $r;
        self.set-pixel($x0, $y0 + $r, $value);
        self.set-pixel($x0, $y0 - $r, $value);
        self.set-pixel($x0 + $r, $y0, $value);
        self.set-pixel($x0 - $r, $y0, $value);
        while $x < $y {
            if $f >= 0 {
                $y--;
                $ddF_y += 2;
                $f += $ddF_y;
            }
            $x++;
            $ddF_x += 2;
            $f += $ddF_x + 1;
            self.set-pixel($x0 + $x, $y0 + $y, $value);
            self.set-pixel($x0 - $x, $y0 + $y, $value);
            self.set-pixel($x0 + $x, $y0 - $y, $value);
            self.set-pixel($x0 - $x, $y0 - $y, $value);
            self.set-pixel($x0 + $y, $y0 + $x, $value);
            self.set-pixel($x0 - $y, $y0 + $x, $value);
            self.set-pixel($x0 + $y, $y0 - $x, $value);
            self.set-pixel($x0 - $y, $y0 - $x, $value);
        }
    }
}
