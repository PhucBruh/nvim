return {
  "rcarriga/nvim-notify",
  opts = {
    -- Set the background color of the notifications
    timeout = 500,
    -- Set the maximum width and height of notifications
    max_width = 60,
    max_height = 10,

    -- Set the position of the notifications
    stage = "fade",

    -- Customize the border
    render = "minimal", -- Choose 'minimal' for a clean look
    top_down = false,
  },
}
