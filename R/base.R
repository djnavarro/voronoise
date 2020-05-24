
#' Generate random points for the voronoi tesselation
#'
#' @param n Number of points
#'
#' @return Data frame with columns x, y and shade
#' @export
base_data <- function(n = 50) {
  data.frame(
    x = stats::runif(n = 50, min = .1, max = .9),
    y = stats::runif(n = 50, min = .1, max = .9),
    shade = sample(grDevices::colours(), size = 50, replace = TRUE),
    stringsAsFactors = FALSE
  )
}


#' Wrapper to a default ggplot for voronoise
#'
#' @param data data for voronoi tesselation
#' @param background background colour of the plot
#'
#' @return a ggplot object
#' @export
base_plot <- function(data = base_data(), background = "antiquewhite3") {
  ggplot(
    data = data,
    mapping = aes(x, y, fill = shade, group = 1)
  ) +
    scale_fill_identity() +
    scale_x_continuous(expand = c(0, 0)) +
    scale_y_continuous(expand = c(0, 0)) +
    theme_mono(background) +
    coord_square()
}
