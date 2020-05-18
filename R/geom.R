#' Voronoise geom
#'
#' @param mapping dfadsf
#' @param data dfsdf
#' @param stat asdfasdf
#' @param peturb sdfsdf
#' @param ... fdssdf
#' @param show.legend sdfsdf
#' @param max.radius adsfasdf
#' @param radius adsfsadf
#' @param expand asdfasdf
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
    show.legend = FALSE,
    max.radius = .1,
    radius = .01,
    expand = -.005
  )
}
