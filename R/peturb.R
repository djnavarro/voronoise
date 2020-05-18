
#' Peturb voronoise tiles uniformly
#'
#' @param data data passed from the voronoi_tile stat
#' @param noise width of the uniform
#'
#' @return peturbed data
#' @export
peturb_uniform <- function(data, noise = .1) {
  data %>% dplyr::mutate(
    x = x + stats::runif(1, min = -noise/2, max = noise/2),
    y = y + stats::runif(1, min = -noise/2, max = noise/2)
  )
}
