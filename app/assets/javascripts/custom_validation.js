$(document).ready(function() {
    $('#new_event').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            first_name: {
                message: 'The firstname is not valid',
                validators: {
                    notEmpty: {
                        message: 'The firstname is required and cannot be empty'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z]+$/,
                        message: 'The firstname can only consist of alphabets'
                    }
                }
            },
             email_id: {
                message: 'The email is not valid',
                validators: {
                    notEmpty: {
                        message: 'The email is required and cannot be empty'
                    },
                    regexp: {
                        regexp: /\S+@\S+\.\S+/,
                        message: 'The email is invalid'
                    }
                }
            },
            phone_no: {
                message: 'The mobile no # is not valid',
                validators: {
                    notEmpty: {
                        message: 'The mobile no is required and cannot be empty'
                    },
                    regexp: {
                        regexp: /^[0-9]*$/,
                        message: 'The mobile no # can only consist of numbers'
                    }
                }
            }
        }
    });
});