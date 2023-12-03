;function declarations
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
  (let ((lines (read-lines-from-file filename)))
    (loop for line in lines
          collect (concatenate 'string
                       (write-to-string (first-number line))
                       (write-to-string (last-number line))))))
  

(defun convert-to-integers (numbers)
  (mapcar #'parse-integer numbers))


(defun print-sum (numbers)
  (let ((integers (convert-to-integers numbers)))
    (format t "The sum is: ~a~%" (apply #'+ integers))))


(defun print-calibration (filename)
  (let ((calibration-values (first-and-last-numbers-from-file filename)))
    (print-sum calibration-values)))


; function calls
(print-calibration '"./calibration.txt")