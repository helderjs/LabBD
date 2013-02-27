<?php $this->Html->css('bootstrap-login.min', null, array('inline' => false)); ?>
<?php $this->Html->css('uniform.default', null, array('inline' => false)); ?>
<?php $this->Html->css('fonts/icomoon/style', null, array('inline' => false)); ?>
<?php $this->Html->css('login.min', null, array('inline' => false)); ?>

<?php $this->Html->script('jquery.placeholder.min', array('inline' => false)); ?>
<?php $this->Html->script('login', array('inline' => false)); ?>
<?php $this->Html->script('jquery.uniform.min', array('inline' => false)); ?>
<?php $this->Html->script('jquery.validate.min', array('inline' => false)); ?>
<div id="login-wrap">

    <div id="login-ribbon"><i class="icon-lock"></i></div>

    <div id="login-buttons">
        <div class="btn-wrap">
            <?php echo $this->Form->button($this->Html->tag('i', '', array('class' => 'icon-key')),
                array('type' => 'button', 'escape' => false, 'class' => 'btn btn-inverse', 'data-target' => '#login-form')); ?>
        </div>
        <div class="btn-wrap">
            <?php echo $this->Form->button($this->Html->tag('i', '', array('class' => 'icon-edit')),
                array('type' => 'button', 'escape' => false, 'class' => 'btn btn-inverse', 'data-target' => '#register-form')); ?>
        </div>
        <div class="btn-wrap">
            <?php echo $this->Form->button($this->Html->tag('i', '', array('class' => 'icon-question-sign')),
                array('type' => 'button', 'escape' => false, 'class' => 'btn btn-inverse', 'data-target' => '#forget-form')); ?>
        </div>
    </div>

    <div id="login-inner">

        <div id="login-circle">
            <?php echo $this->element('form_login'); ?>
            <?php echo $this->element('form_register'); ?>
            <section id="forget-form" class="login-inner-form" data-angle="180">
                <h1>Reset Password</h1>
                <form class="form-vertical" action="http://www.malijuthemeshop.com/themes/mooncake/dashboard.html">
                    <div class="control-group">
                        <div class="controls">
                            <input type="text" class="big" placeholder="Enter Your Email...">
                        </div>
                    </div>
                    <div class="form-actions">
                        <button type="submit" class="btn btn-danger btn-block btn-large">Reset</button>
                    </div>
                </form>
            </section>
        </div>

    </div>

</div>
