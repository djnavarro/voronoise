#' Voronoise geom
#'
#' @param mapping ggplot2 mapping specified by aes()
#' @param data data frame containing the values to use
#' @param stat the statistic to compute
#' @param perturb a perturbing function
#' @param ... arguments to be passed to geom_voronoi_tile()
#' @param show.legend by default no legend is displayed
#' @param max.radius specifies the maximum distance from tile to point
#' @param radius radius specifying curvature of the tile corners
#' @param expand space between adjacent tiles
#'
#' @export
geom_voronoise <- function(
  mapping = NULL,
  data = NULL,
  stat = "voronoise_tile",
  perturb = identity,
  ...,
  show.legend = FALSE,
  max.radius = .1,
  radius = .01,
  expand = -.005
) {

  geom_voronoi_tile(
    mapping = mapping,
    data = data,
    stat = stat,
    perturb = perturb,
    ...,
    show.legend = show.legend,
    max.radius = max.radius,
    radius = radius,
    expand = expand
  )
}
