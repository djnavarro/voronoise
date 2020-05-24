
theme_mono <- function(background = "black"){
  ggplot2::theme_void() +
  ggplot2::theme(
    panel.background = ggplot2::element_rect(
      fill = background,
      colour = background
    ),
    plot.background = ggplot2::element_rect(
      fill = background,
      colour = background
    )
  )
}


# #' Like coord_fixed() but forced to be a square
# #'
# #' @param x bottom side of the square
# #' @param y left side of the square
# #' @param s side length
# #' @param ... arguments to be passed to coord_fixed()

coord_square <- function(x = 0, y = 0, s = 1, ...) {
  ggplot2::coord_fixed(xlim = c(x, s), ylim = c(y, s), ...)
}
