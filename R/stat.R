# define the voronoise stat

#' Voronoise extensions to ggplot2
#'
#' The voronoise package provides the voronoise_tile stat.
#'
#' @export
StatVoronoiseTile <- ggplot2::ggproto(
  "StatVoronoiseTile", ggforce::StatVoronoiTile,
  compute_group = function(data, scales, bound = NULL, eps = 1e-09,
                           max.radius = NULL, normalize = FALSE,
                           asp.ratio = 1, peturb = peturb_uniform) {

    vtile <- ggforce::StatVoronoiTile$compute_group(
      data, scales, bound, eps, max.radius,
      normalize, asp.ratio)

    vtile <- vtile %>%
      dplyr::group_by(group) %>%
      peturb() %>%
      dplyr::ungroup()

    return(vtile)
  }
)

