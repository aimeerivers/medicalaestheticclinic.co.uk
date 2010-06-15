module ColoursHelper

  def hexToRGB(hex)
    [hex[0..1].hex, hex[2..3].hex, hex[4..5].hex]
  end

	def rgbToHSV(r, g, b)
    r = r / 255.0
    g = g / 255.0
    b = b / 255.0
		max = [r, g, b].max
		min = [r, g, b].min
		delta = max - min

    v = max

    s = 0
    s = delta / max unless max == 0

    if s == 0
      h = 0
    else
      if r == max
        h = (g - b) / delta
      elsif g == max
        h = 2 + (b - r) / delta
      elsif b == max
        h = 4 + (r - g) / delta
      end

      h *= 60
      h += 360 if h < 0
    end
    [h, s*100, v*100]
	end

end

Webby::Helpers.register(ColoursHelper)
