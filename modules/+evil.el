(setup (:package evil evil-collection)
  (:option evil-want-integration t
	   evil-want-keybinding nil)
  (:hook-into after-init)
  (:hook which-key-mode
	 evil-collection-init))
