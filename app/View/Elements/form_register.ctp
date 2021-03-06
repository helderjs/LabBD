<section id="register-form" class="login-inner-form" data-angle="90">
<h1><?php echo __('Register'); ?></h1>
    <?php echo $this->Form->create('register', array('class' => 'form-vertical')); ?>
        <div class="control-group">
            <label class="control-label"><?php echo __('Company name'); ?></label>
            <div class="controls">
                <?php echo $this->Form->text('Company.name'); ?>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label"><?php echo __('Attendant name'); ?></label>
            <div class="controls">
                <?php echo $this->Form->text('Attendant.name'); ?>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label"><?php echo __('Login'); ?></label>
            <div class="controls">
                <?php echo $this->Form->text('User.login'); ?>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label"><?php echo __('Mail'); ?></label>
            <div class="controls">
                <?php echo $this->Form->text('User.mail'); ?>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label"><?php echo __('Password'); ?></label>
            <div class="controls">
                <?php echo $this->Form->password('User.password'); ?>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label"><?php echo __('Confirm Password'); ?></label>
            <div class="controls">
                <?php echo $this->Form->password('User.confirm_password'); ?>
            </div>
        </div>
        <div class="form-actions">
            <?php echo $this->Form->submit('Register', array('class' => 'btn btn-danger btn-block btn-large')); ?>
        </div>
    <?php echo $this->Form->end(); ?>
</section>
<script type="text/javascript">
    $(document).ready(function() {
        $("#registerRegisterForm").validate({
            rules: {
                "data[Company][name]": {
                    required: true,
                    minlength: 3,
                },
                "data[Attendant][name]": {
                    required: true,
                    minlength: 3,
                },
                "data[User][login]": {
                    required: true,
                    minlength: 5,
                },
                "data[User][mail]": {
                    required: true,
                    email: true
                },
                "data[User][password]": {
                    required: true,
                    minlength: 8
                },
                "data[User][confirm_password]": {
                    required: true,
                    minlength: 8,
                    equalTo: '[id="UserConfirmPassword"]'
                }
            },
            messages: {
                "data[Company][name]": {
                    required: '<?php echo __('This field is required.'); ?>',
                    minlength: '<?php echo __('This field must be at least 3 characters.'); ?>',
                },
                "data[Attendant][name]": {
                    required: '<?php echo __('This field is required.'); ?>',
                    minlength: '<?php echo __('This field must be at least 3 characters.'); ?>',
                },
                "data[User][login]": {
                    required: '<?php echo __('This field is required.'); ?>',
                    minlength: '<?php echo __('This field must be at least 5 characters.'); ?>',
                },
                "data[User][mail]": {
                    required: '<?php echo __('This field is required.'); ?>',
                        email: '<?php echo __('Please enter a valid email address.'); ?>'
                },
                "data[User][password]": {
                    required: '<?php echo __('This field is required.'); ?>',
                    minlength: '<?php echo __('This field must be at least 8 characters.'); ?>',
                },
                "data[User][confirm_password]": {
                    required: '<?php echo __('This field is required.'); ?>',
                    minlength: '<?php echo __('This field must be at least 8 characters.'); ?>',
                    equalTo: '<?php echo __('Please enter the same value again.'); ?>'
                }
            },
        	showErrors: function() {
				this.defaultShowErrors();
			}
        });
    });
</script>
