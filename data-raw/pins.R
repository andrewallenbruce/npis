pin_update <- function(x, name, title, description) {
  board <- pins::board_folder(fs::path_abs("inst/extdata/pins"))

  pins::pin_write(
    board,
    x,
    name = name,
    title = title,
    description = description,
    type = "rds"
  )

  pins::write_board_manifest(board)
}

delete_pins <- function(pin_names) {
  board <- pins::board_folder(fs::path_abs("inst/extdata/pins"))

  pins::pin_delete(board, names = pin_names)
}
