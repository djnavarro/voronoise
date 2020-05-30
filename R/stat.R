# define the voronoise stat

#' Voronoise stat
#'
#' The voronoise package provides the voronoise_tile stat.
#'
#' @export
StatVoronoiseTile <- ggplot2::ggproto(
  "StatVoronoiseTile", ggforce::StatVoronoiTile,
  compute_group = function(data, scales, bound = NULL, eps = 1e-09,
                           max.radius = NULL, normalize = FALSE,
                           asp.ratio = 1, perturb = perturb_uniform()) {

    vtile <- ggforce::StatVoronoiTile$compute_group(
      data = data, scales = scales, bound = bound, eps = eps,
      max.radius = max.radius, normalize = normalize,
      asp.ratio = asp.ratio)

    return(perturb(vtile))
  }
)

