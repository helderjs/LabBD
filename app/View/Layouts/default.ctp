<!DOCTYPE html>
<!--[if lt IE 7]> <html class="lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!-->
<html lang="en">
<!--<![endif]-->
    <head>
        <meta charset="utf-8" />

        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
        <meta name="description" content="Social Support System" />
        <meta name="author" content="SwiftLbas <www.swiftlabs.com.br>" />

        <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
        <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->

        <title>SocialSupport :: <?php echo _('Making Support Easy'); ?></title>

        <?php echo $this->fetch('meta'); ?>
        <?php echo $this->fetch('css'); ?>

        <?php echo $this->Html->script('jquery'); ?>
        <?php echo $this->fetch('script'); ?>
    </head>
    <body>
        <?php echo $this->fetch('content'); ?>
    </body>
</html>
