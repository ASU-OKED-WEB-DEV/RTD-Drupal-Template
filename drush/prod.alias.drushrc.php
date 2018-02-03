<?php  
// prod.alias.drushrc.php
// Replace $USER with the site's username.
// Refer to this tutorial for setting up SSH Keys: https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/

$aliases['prod'] = array(
  // Drupal's root directory for that site (not the sites/* folder)   
  'root' => '/home/$USER/web',
  // FQDN or IP of server hosting site (think ssh user@remote-host)   
  'remote-host' => 'prod.rtd.asu.edu',
  // A user on the remote host for which you have an ssh key set up   
  'remote-user' => '$USER',
);   

