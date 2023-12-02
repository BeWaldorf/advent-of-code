(defun read-file-line-by-line (filename)
  (with-open-file (file-stream filename :direction :input)
    (loop for line = (read-line file-stream nil nil)
          while line
          collect line)))


;; Usage example
(print-lines-of-file "test.txt")