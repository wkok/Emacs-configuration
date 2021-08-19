;;; navigate --- Moving back & forward like IntelliJ

;;; Commentary:
;;; See: https://newbedev.com/how-to-move-forward-and-backward-in-emacs-mark-ring

;;; Code:

(defun marker-is-point-p (marker)
  "Test if MARKER is current point."
  (and (eq (marker-buffer marker) (current-buffer))
       (= (marker-position marker) (point))))

(defun push-mark-maybe ()
  "Push mark onto `global-mark-ring' if mark head or tail is not current location."
  (if (not global-mark-ring) (error "Global-mark-ring empty")
    (unless (or (marker-is-point-p (car global-mark-ring))
                (marker-is-point-p (car (reverse global-mark-ring))))
      (push-mark))))


(defun backward-global-mark ()
  "Use `pop-global-mark', pushing current point if not on ring."
  (interactive)
  (push-mark-maybe)
  (when (marker-is-point-p (car global-mark-ring))
    (call-interactively 'pop-global-mark))
  (call-interactively 'pop-global-mark))

(defun forward-global-mark ()
  "Hack `pop-global-mark' to go in reverse, pushing current point if not on ring."
  (interactive)
  (push-mark-maybe)
  (setq global-mark-ring (nreverse global-mark-ring))
  (when (marker-is-point-p (car global-mark-ring))
    (call-interactively 'pop-global-mark))
  (call-interactively 'pop-global-mark)
  (setq global-mark-ring (nreverse global-mark-ring)))

(global-set-key (kbd "C-M-<") (quote backward-global-mark))
(global-set-key (kbd "C-M->") (quote forward-global-mark))

(provide 'navigate)
;;; navigate.el ends here
