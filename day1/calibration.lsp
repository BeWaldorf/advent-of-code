(defun char-to-int (char)
  (- (char-int char) (char-int #\0)))


(defun first-number (string)
  (char-to-int 
    (find-if #'digit-char-p (string string))))


(defun last-number (string)
  (let ((reversed-string (reverse string)))
    (first-number reversed-string)))


(defun read-lines-from-file (filename)
  (with-open-file (stream filename :direction :input)
    (loop for line = (read-line stream nil nil)
          while line
          collect line)))


(defun first-and-last-numbers-from-file (filename)
  (with-open-file (stream filename :direction :input)
    (loop for line = (read-line stream nil nil)
          while line
          collect (let ((first (first-number line))
                        (last (last-number line)))
                    (when (and first last)
                      (+ first last))))))


(defun print-sum (number)
  (format t "The sum is: ~a~%" number))


(defun print-calibration (filename)
  (let ((calibration-values (first-and-last-numbers-from-file filename)))
    (print-sum (apply #'+ calibration-values))))

(print-calibration '"./calibration.txt")