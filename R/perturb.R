
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
#' @param angle direction of the drift
#' @param noise function to generate random number on the unit interval (defaults to beta density)
#' @param ... arguments to be passed to noise
#'
#' @return A function that takes data as input
#' @export
perturb_float <- function(angle = 90, bound = TRUE, noise = NULL, ...) {

  angle <- radians(angle)
  x_move <- cos(angle)
  y_move <- sin(angle)

  if(is.null(noise)) {
    noise <- function(a = 1, b = 3) {
      stats::rbeta(1, a, b)
    }
  }

  function(data) {
    data %>%
      dplyr::group_by(group) %>%
      dplyr::mutate(
        s = noise(),
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

