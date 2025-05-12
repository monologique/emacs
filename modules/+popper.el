(setup (:package popper)
  (:option popper-reference-buffers '("\\*Messages\\*"
				      "Output\\*$"
				      "\\*Async Shell Command\\*"
				      help-mode
				      compilation-mode))
  (:hook-into after-init))
