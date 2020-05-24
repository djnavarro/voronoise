
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



#' Perturb voronoi tiles by drifting along an axis
#'
#' @param bound should the drift be bounded at the edge of the box
#' @param angles possible directions for the drift in degrees
#' @param noise parameters specifying the noise
#'
#' @return A function that takes data as input
#' @export
perturb_float <- function(angles = 90, bound = TRUE, noise = c(1, 5)) {
  function(data) {

    data %>%
      dplyr::group_by(group) %>%
      dplyr::mutate(
        s = stats::rbeta(1, noise[1], noise[2]),
        th = sample(radians(angles), 1),
        x_move = cos(th),
        y_move = sin(th),
        x = dplyr::case_when(
          bound == FALSE              ~  x + s * x_move,
          bound == TRUE & x_move > 0  ~  x + s * x_move * (1 - max(x)),
          bound == TRUE & x_move < 0  ~  x + s * x_move * min(x),
          TRUE                        ~  x + s * x_move
        ),
        y = dplyr::case_when(
          bound == FALSE              ~  y + s * y_move,
          bound == TRUE & y_move > 0  ~  y + s * y_move * (1 - max(y)),
          bound == TRUE & y_move < 0  ~  y + s * y_move * min(y),
          TRUE                        ~  y + s * y_move
        ),
      ) %>%
      dplyr::ungroup()
  }
}

radians <- function(x) {
  (x / 360) * 2 * pi
}

