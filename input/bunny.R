library(magick)
library(bunny)

x <- magick::image_read("input/raw_image.png")

hex_canvas <- image_canvas_hex(border_color="#0d4448", border_size = 2, fill_color = "#ede6f2")
hex_border <- image_canvas_hexborder(border_color="#0d4448", border_size = 4)

img_hex <- hex_canvas %>%
  bunny::image_compose(x, gravity = "center", offset = '-50+50')%>%
  magick::image_annotate("helpdesk", size=200, gravity = "north", location = '-0+300',font = "Aller", color = "#0d4448")%>%
  bunny::image_compose(hex_border, gravity = "center", operator = "Over")

img_hex%>%
  magick::image_scale("200x200") %>%
  magick::image_write(here::here("input", "logo.png"), density = 600)

img_hex%>%
magick::image_scale("1200x1200") %>%
magick::image_write(here::here("input", "hex.png"), density = 600)


img_hex_gh <- img_hex %>%
  image_scale("400x400")

gh_logo <- bunny::github %>%
  image_scale("50x50")

gh <- image_canvas_ghcard("#ede6f2") %>%
  image_compose(img_hex_gh, gravity = "East", offset = "+0+0") %>%
  image_annotate("Are You Being Served?", gravity = "West", location = "+50-30",
                 color="#0d4448", size=60, font="Aller", weight = 700) %>%
  image_compose(gh_logo, gravity="West", offset = "+50+40") %>%
  image_annotate("yonicd/helpdesk", gravity="West", location="+110+45",
                 size=50, font="Ubuntu Mono") %>%
  image_border_ghcard("#ede6f2")

gh %>%
  image_write(here::here("input", "helpdesk_ghcard.png"))
