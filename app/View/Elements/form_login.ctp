<section id="login-form" class="login-inner-form active" data-angle="0">
    <h1><?php echo __('Login'); ?></h1>
    <?php echo $this->Form->create('login', array('class' => 'form-vertical')); ?>
        <div class="control-group">
            <?php echo $this->Form->text('User.login', array('placeholder' => __('Username'), 'id' => 'input-username', 'class' => 'big')); ?>
            <?php echo $this->Form->password('User.password', array('placeholder' => __('Password'), 'id' => 'input-password', 'class' => 'big')); ?>
        </div>
        <div class="control-group">
            <label class="checkbox">
            <?php echo $this->Form->checkbox('rememberme', array('class' => 'uniform')); ?><?php echo __('Remember me'); ?>
            </label>
        </div>
        <div class="form-actions">
            <?php echo $this->Form->submit('Login', array('class' => 'btn btn-success btn-block btn-large')); ?>
        </div>
    <?php echo $this->Form->end(); ?>
</section>
