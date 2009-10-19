<?php
/**
 * 
 * STOP!!!!!!!!
 * 
 * 
 * 
 * 
 * Are you editing the crystal skin directly?
 * DON'T
 * 
 * Copy and rename the crystal folder. Otherwise it'll get 
 * overwritten in an update.
 * 
 * Also, READ THE DOCS
 * 
 *   http://www.phpvms.net/docs/skinning
 * 
 */
?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en" dir="ltr">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><?php echo $title; ?></title>

<link rel="stylesheet" media="all" type="text/css" href="<?php echo SITE_URL?>/lib/skins/crystal/styles.css" />

<?php
	Template::Show('core_htmlhead.tpl');
?>

</head>
<body>
<div id="body">
<div id="innerwrapper">
<?php
	Template::Show('core_htmlreq.tpl');
?>
	<div id="topBanner">
		<div id="topLogin">
		<?php 
		/* Only show this login form if they're logged in */
		if(Auth::LoggedIn() == false)
		{ ?>
		
			<form name="loginform" action="<?php echo SITE_URL?>/index.php/login" method="post">
				Sign-in with your pilot id or email, or <a href="<?php SITE_URL?>/index.php/registration">register</a><br />
				<input type="text" name="email" value="" onClick="this.value=''" />
				<input type="password" name="password" value="" />
				<input type="hidden" name="remember" value="on" />
				<input type="hidden" name="redir" value="index.php/profile" />
				<input type="hidden" name="action" value="login" />
				<input type="submit" name="submit" value="Log In" />
			</form>
		
		<?php
		}	
		/* End the Auth::LoggedIn() if */
		else /* Else - they're logged in, so show some info about the pilot, and a few links */
		{
			
			/* Auth::$userinfo has the information about the user currently logged in */
			
			/* We will use this, this gets their full pilot id, formatted properly */
			$pilotid = PilotData::GetPilotCode(Auth::$userinfo->code, Auth::$userinfo->pilotid);
		?>
			<img align="left" height="50px" width="50px" style="margin-right: 10px;"
				src="<?php echo PilotData::getPilotAvatar($pilotid);?>" />
				
			<strong>Pilot ID: </strong> <?php echo $pilotid ; ?>
			<strong>Rank: </strong><?php echo Auth::$userinfo->rank;?><br />
			<strong>Total Flights: </strong><?php echo Auth::$userinfo->totalflights?>, <strong>Total Hours: </strong><?php echo Auth::$userinfo->totalhours;?><br />
			
			<a href="<?php SITE_URL?>/index.php/pireps/new">File a New PIREP</a> | 
			<a href="<?php SITE_URL?>/index.php/schedules/bids">View My Bids</a> | 
			<a href="<?php SITE_URL?>/index.php/profile/">View Pilot Center</a>
		<?php
		} /* End the else */
		?>
		</div>
	</div>
	
	<div id="topNav">
		<ul class="nav">
			<?php
				Template::Show('core_navigation.tpl');
			?>
		</ul>
	</div>
	
	<div id="bodytext">