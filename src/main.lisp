(defpackage :damona
  (:use :cl))
(in-package :damona)

(eval-when (:compile-toplevel :load-toplevel :execute)
  (ql:quickload '("usocket")))

(defparameter all-sockets `())

(defun handle-client-socket (sock)
  (format t "Todo ~%"))

(defun start-vnode-server (host port)
  (let* ((main-socket (usocket:socket-listen host port :reuseaddress t)))
    (push main-socket all-sockets)
    (loop
     (loop for sock in (usocket:wait-for-input all-sockets :ready-only t)
           do (if (eq sock main-socket)
                  (let ((client-socket (usocket:socket-accept main-socket :element-type '(unsigned-byte 8))))
                    (push client-socket all-sockets))
                  (handler-case
                      (handle-client-socket sock)
                    (t (e)
                       (format t "Error: ~a" e)
                       (setf all-sockets (delete sock all-sockets))
                       (usocket:socket-close sock))))))))

(defun connect-to-vnode (host port)
  (let* ((sock (usocket:socket-connect host port)))
    (push sock all-sockets)))