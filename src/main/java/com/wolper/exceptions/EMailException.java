package com.wolper.exceptions;

public class EMailException extends RuntimeException {
        private static final long serialVersionUID = 1L;
        private final String message;
        public EMailException(String message) {
            this.message = message;
        }
        @Override
        public String getMessage() {
            return message;
        }
    }
