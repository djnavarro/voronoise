
#' Perturb voronoise tiles uniformly
#'
#' @param noise width of the uniform
#'
#' @return A function that takes data as input
#' @export
perturb_uniform <- function(noise = .1) {
  function(data) {
    data %>%
      dplyr::group_by(group) %>%
      dplyr::mutate(
        x = x + stats::runif(1, min = -noise/2, max = noise/2),
        y = y + stats::runif(1, min = -noise/2, max = noise/2)
      ) %>%
      dplyr::ungroup()
  }
}
