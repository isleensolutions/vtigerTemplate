{strip}
     {assign var="topMenus" value=$MENU_STRUCTURE->getTop()}
    {assign var="moreMenus" value=$MENU_STRUCTURE->getMore()}
        {assign var=NUMBER_OF_PARENT_TABS value = count(array_keys($moreMenus))}            
    <div class="sidebar-toggle-box">
        <div class="" data-placement="right" data-original-title="Toggle Navigation"></div>
                          
           <li class="dropdown list-unstyled">
           <a href="index.php?module=Home&view=DashBoard"><i class="fa fa-home fa-2x" style="padding-right: 10px;"></i></a>
            <a href="#" data-toggle="dropdown" class="dropdown-toggle fa fa-bars tooltips"></a>
                                <ul class="dropdown-menu wide-full">
                                    <li>
                                        <!-- Content container to add padding -->
                                        <div class="yamm-content">
                                            <div class="row">
                                            
                                            
           <ul class="col-sm-12 list-unstyled">
                   <li class="customAllmodules"> <br />
                  
                        {foreach key=parent item=moduleList from=$moreMenus name=more}
                            {if $NUMBER_OF_PARENT_TABS >= 4} 
                                {assign var=SPAN_CLASS value=span3} 
                                {elseif $NUMBER_OF_PARENT_TABS == 3} 
                                {assign var=SPAN_CLASS value=span4} 
                                {elseif $NUMBER_OF_PARENT_TABS <= 2} 
                                {assign var=SPAN_CLASS value=span6} 
                            {/if} 

                                    
                                <ul class="col-sm-2 list-unstyled">
                                <strong class="title">{vtranslate("LBL_$parent",$moduleName)}</strong><hr>                                 
                                    {foreach key=moduleName item=moduleModel from=$moduleList}
                                        {assign var='translatedModuleLabel' value=vtranslate($moduleModel->get('label'),$moduleName)}
                                        <li><label class="moduleNames col-lg-12 paddingLeftRight"><a id="menubar_item_{$moduleName}" href="{$moduleModel->getDefaultUrl()}">{$translatedModuleLabel}</a></label> </li>
                                    {/foreach}
                                    </ul>
                       

                        {/foreach}                            
                        </li>   
                                                   
                    </ul>
                                                <!--<ul class="col-sm-2 list-unstyled">
                                                    <li>
                                                        <p class="title">Standard</p>
                                                    </li>
                                                    <li><a href="#"> Normal Navigation </a></li>
                                                    <li><a href="#"> Execellent menu </a></li>
                                                    <li><a href="#"> Customizable </a></li>
                                                    <li><a href="#"> Huge Components </a></li>
                                                    <li><a href="#"> Bootstrap v3.2 </a></li>
                                                    <li><a href="#"> Fontawesome </a></li>
                                                </ul>
                                                <ul class="col-sm-2 list-unstyled">
                                                    <li>
                                                        <p class="title">Description</p>
                                                    </li>
                                                    <li>
                                                        <a href="#">
                                                            <span class="d-title">Title Goes Here</span>
                                                            <span class="d-desk">Description goes here</span>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="#">
                                                            <span class="d-title">Amaging Dashboard</span>
                                                            <span class="d-desk">Build with BS3</span>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="#">
                                                            <span class="d-title">2000 Satisfied Client</span>
                                                            <span class="d-desk">Max 5 star rating</span>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="#">
                                                            <span class="d-title">Easy to Cutomize</span>
                                                            <span class="d-desk">Very easy to use</span>
                                                        </a>
                                                    </li>

                                                </ul>
                                                <ul class="col-sm-2 list-unstyled">
                                                    <li>
                                                        <p class="title">Iconic</p>
                                                    </li>
                                                    <li><a href="#"><i class="fa fa-arrow-circle-right text-muted"></i>  Right Angle </a></li>
                                                    <li><a href="#"><i class="fa fa-desktop text-muted"></i>  Desktop Icon </a></li>
                                                    <li><a href="#"><i class="fa fa-laptop text-muted"></i>  Laptop Icon</a></li>
                                                    <li><a href="#"><i class="fa fa-mobile text-muted"></i>  Mobile Icon </a></li>
                                                    <li><a href="#"><i class="fa fa-lock text-muted"></i>  Lock Icon </a></li>
                                                </ul>
                                                <ul class="col-sm-3 list-unstyled">
                                                    <li>
                                                        <p class="title">Image + Description</p>
                                                    </li>
                                                    <li>
                                                        <a href="#">
                                                            <img class="icon-img" src="libraries/isleen/img/mega_icon1.png" alt="">
                                                            <span class="icon-desk">
                                                                <span class="d-title">Title Goes Here</span>
                                                                <span class="d-desk">Description goes here</span>
                                                            </span>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="#">
                                                            <img class="icon-img" src="libraries/isleen/img/mega_icon2.png" alt="">
                                                            <span class="icon-desk">
                                                                <span class="d-title">Amaging Dashboard</span>
                                                                <span class="d-desk">Build with BS3</span>
                                                            </span>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="#">
                                                            <img class="icon-img" src="libraries/isleen/img/mega_icon3.png" alt="">
                                                            <span class="icon-desk">
                                                                <span class="d-title">2000 Satisfied Client</span>
                                                                <span class="d-desk">Max 5 star rating</span>
                                                            </span>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="#">
                                                            <img class="icon-img" src="libraries/isleen/img/mega_icon4.png" alt="">
                                                            <span class="icon-desk">
                                                                <span class="d-title">Easy to Cutomize</span>
                                                                <span class="d-desk">Very easy to use</span>
                                                            </span>
                                                        </a>
                                                    </li>

                                                </ul>
                                                <ul class="col-sm-3 list-unstyled custom-nav-img">
                                                    <li>
                                                        <p class="title">Custom</p>
                                                    </li>
                                                    <li>
                                                        <p class="desk">
                                                            Consectetur ullamcorper purus a rutrum. Etiam dui nisi, hendrerit feugiat serisque et, cursus eu magna.
                                                        </p>
                                                    </li>
                                                    <div class="mega-bg"></div>
                                                </ul>           -->

                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </li>
    </div>     
    <a href="index.php?module=Home&view=DashBoard" class="logo">Isleen<span>CRM</span></a> 
    <div class="nav notify-row" id="top_menu">
                <!--  notification start -->
                <ul class="nav top-menu">
                    <!-- settings start -->
                    <li class="dropdown" id="header_task_notification">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#" >
                            <i class="fa fa-tasks"></i>
                        </a>
                    </li>
                    <!-- settings end -->
                    <!-- inbox dropdown start-->
                    <li id="header_inbox_bar" class="dropdown">
                        <a data-toggle="dropdown" title="Message" class="dropdown-toggle" href="#">
                            <i class="fa fa-envelope-o"></i>
                            <span class="badge bg-important">5</span>
                        </a>
                        <ul class="dropdown-menu extended inbox">
                            <div class="notify-arrow notify-arrow-red"></div>
                            <li>
                                <p class="red">You have 5 new messages</p>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="photo"><img alt="avatar" src="libraries/isleen/img/avatar-mini.jpg"></span>
                                    <span class="subject">
                                    <span class="from">Jonathan Smith</span>
                                    <span class="time">Just now</span>
                                    </span>
                                    <span class="message">
                                        Hello, this is an example msg.
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="photo"><img alt="avatar" src="libraries/isleen/img/avatar-mini2.jpg"></span>
                                    <span class="subject">
                                    <span class="from">Jhon Doe</span>
                                    <span class="time">10 mins</span>
                                    </span>
                                    <span class="message">
                                     Hi, Jhon Doe Bhai how are you ?
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="photo"><img alt="avatar" src="libraries/isleen/img/avatar-mini3.jpg"></span>
                                    <span class="subject">
                                    <span class="from">Jason Stathum</span>
                                    <span class="time">3 hrs</span>
                                    </span>
                                    <span class="message">
                                        This is awesome dashboard.
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="photo"><img alt="avatar" src="libraries/isleen/img/avatar-mini4.jpg"></span>
                                    <span class="subject">
                                    <span class="from">Jondi Rose</span>
                                    <span class="time">Just now</span>
                                    </span>
                                    <span class="message">
                                        Hello, this is metrolab
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a href="#">See all messages</a>
                            </li>
                        </ul>
                    </li>
                    <!-- inbox dropdown end -->
                    <!-- notification dropdown start-->
                    <li id="header_notification_bar" class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#" id="notification-read">

                            <i class="fa fa-bell-o"></i>

                        </a>
                    </li>
                    <!-- notification dropdown end -->
                </ul>
                <!--  notification end -->
            </div>
            <button data-target=".navbar-collapse" data-toggle="collapse" class="navbar-toggle header-toggle" type="button">
                  <span class="fa fa-bar"></span>
                  <span class="fa fa-bar"></span>
                  <span class="fa fa-bar"></span>
              </button>
            <div class="searchElement horizontal-menu navbar-collapse collapse paddingLeftRight" style=" overflow: hidden;">
                        <div class="select-search">
                            <select class="chzn-select" id="basicSearchModulesList" style="width:150px;">
                                <option value="" class="globalSearch_module_All">{vtranslate('LBL_ALL_RECORDS', $MODULE_NAME)}</option>
                                {foreach key=MODULE_NAME item=fieldObject from=$SEARCHABLE_MODULES}
                                    <option value="{$MODULE_NAME}" class="globalSearch_module_{$MODULE_NAME}">{vtranslate($MODULE_NAME,$MODULE_NAME)}</option>
                                {/foreach}
                                
                            </select>
                        </div>
                        <div class="input-append searchBar">
                            <input type="text" class="form-control search" id="globalSearchValue" placeholder="{vtranslate('LBL_GLOBAL_SEARCH')}" results="10" />
                            {*<!--<span id="searchIcon" class="add-on search-icon"><i class="fa fa-search"></i></span>-->*}
                            <span class="adv-search">
                                <a class="alignMiddle" id="globalSearch">{vtranslate('LBL_ADVANCE_SEARCH')}</a>
                            </span>
                        </div>
                         <div class="crmsetting">
                            <ul class="nav pull-right top-menu navbar-nav">
                            <li>
                            <a id="menubar_quickCreate" class="header_toggle2" alt="{vtranslate('LBL_QUICK_CREATE',$MODULE)}" title="{vtranslate('LBL_QUICK_CREATE',$MODULE)}" data-toggle="dropdown"><i class="fa fa-plus"></i></a>
                            <ul class="dropdown-menu dropdownStyles commonActionsButtonDropDown">
                                    <li class="title"><strong>{vtranslate('Quick Create',$MODULE)}</strong></li>
                                    <li id="quickCreateModules">
                                        <div class="row-fluid">
                                            <div class="col-md-12">
                                                {foreach key=moduleName item=moduleModel from=$MENUS}
                                                    {if $moduleModel->isPermitted('EditView')}
                                                        {assign var='quickCreateModule' value=$moduleModel->isQuickCreateSupported()}
                                                        {assign var='singularLabel' value=$moduleModel->getSingularLabelKey()}
                                                        {if $singularLabel == 'SINGLE_Calendar'}
                                                            {assign var='singularLabel' value='LBL_EVENT_OR_TASK'}
                                                        {/if}   
                                                        {if $quickCreateModule == '1'}
                                                            {if $count % 3 == 0}
                                                                <div class="row-fluid">
                                                                {/if}
                                                                <div class="col-md-4 QuickHover">
                                                                    <a id="menubar_quickCreate_{$moduleModel->getName()}" class="quickCreateModule" data-name="{$moduleModel->getName()}"
                                                                       data-url="{$moduleModel->getQuickCreateUrl()}" href="javascript:void(0)">{vtranslate($singularLabel,$moduleName)}</a>
                                                                </div>
                                                                {if $count % 3 == 2}
                                                                </div>
                                                            {/if}
                                                            {assign var='count' value=$count+1}
                                                        {/if}
                                                    {/if}
                                                {/foreach}
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                    </li>

                    {foreach key=index item=obj from=$HEADER_LINKS}
                        {assign var="src" value=$obj->getIcon()}
                        {assign var="icon" value=$obj->getIcon()}
                        {assign var="title" value=$obj->getLabel()}
                        {assign var="childLinks" value=$obj->getChildLinks()}
                        <!-- user login dropdown start-->
                        <li class="dropdown">
                            {if !empty($src)}
                                <a data-toggle="dropdown" class="dropdown-toggle header_toggle2" href="#">
                                    {$src}
                                </a>
                            {else}
                            {/if}
                            {if !empty($childLinks) && empty($src)}
                                <ul class="dropdown-menu extended logout">
                                    <div class="log-arrow-up"></div>
                                    <li>
                                        <a href="{$USER_MODEL->getPreferenceDetailViewUrl()}"><i class=" fa fa-suitcase"></i>Profile</a>
                                    </li>
                                    <li>
                                        <a href="{$USER_MODEL->getPreferenceDetailViewUrl()}"><i class="fa fa-cog"></i> Preferences</a>
                                    </li>
                                    <li>
                                        <a href="#"><i class="fa fa-bell-o"></i> Notification</a>
                                    </li>
                                    <li>
                                        <a href="index.php?module=Users&parent=Settings&action=Logout"><i class="fa fa-key"></i> Log Out</a>
                                    </li>
                                </ul>
                                {else}
                                <ul class="dropdown-menu extended pull-right toggle-setting">
                                    <div class="log-arrow-up"></div>
                                    {foreach key=index item=obj from=$childLinks}
                                                {if $obj->getLabel() eq NULL}
                                                    <li class="divider">&nbsp;</li>
                                                {else}
                                                    {assign var="id" value=$obj->getId()}
                                                    {assign var="href" value=$obj->getUrl()}
                                                    {assign var="label" value=$obj->getLabel()}
                                                    {assign var="onclick" value=""}
                                                    {if stripos($obj->getUrl(), 'javascript:') === 0}
                                                        {assign var="onclick" value="onclick="|cat:$href}
                                                        {assign var="href" value="javascript:;"}
                                                    {/if}
                                                    <li>
                                                        <a target="{$obj->target}" id="menubar_item_right_{Vtiger_Util_Helper::replaceSpaceWithUnderScores($label)}"  href="{$href}" {$onclick}>{vtranslate($label,$MODULE)}</a>
                                                    </li>
                                                {/if}
                                    {/foreach}
                                </ul>
                            {/if}
                        </li>
                        <!-- user login dropdown end -->
                    {/foreach}
                </ul>
                </div>

            </div>
           
                <!--search & user info start-->
              {*<!--  <ul class="nav pull-right top-menu navbar-nav">
                    <li>
                        <a id="menubar_quickCreate" alt="{vtranslate('LBL_QUICK_CREATE',$MODULE)}" title="{vtranslate('LBL_QUICK_CREATE',$MODULE)}" data-toggle="dropdown"><i class="fa fa-plus"></i></a>
                        <ul class="dropdown-menu dropdownStyles commonActionsButtonDropDown">
                                    <li class="title"><strong>{vtranslate('Quick Create',$MODULE)}</strong></li>
                                    <li id="quickCreateModules">
                                        <div class="row-fluid">
                                            <div class="col-md-12">
                                                {foreach key=moduleName item=moduleModel from=$MENUS}
                                                    {if $moduleModel->isPermitted('EditView')}
                                                        {assign var='quickCreateModule' value=$moduleModel->isQuickCreateSupported()}
                                                        {assign var='singularLabel' value=$moduleModel->getSingularLabelKey()}
                                                        {if $singularLabel == 'SINGLE_Calendar'}
                                                            {assign var='singularLabel' value='LBL_EVENT_OR_TASK'}
                                                        {/if}   
                                                        {if $quickCreateModule == '1'}
                                                            {if $count % 3 == 0}
                                                                <div class="row-fluid">
                                                                {/if}
                                                                <div class="col-md-4 QuickHover">
                                                                    <a id="menubar_quickCreate_{$moduleModel->getName()}" class="quickCreateModule" data-name="{$moduleModel->getName()}"
                                                                       data-url="{$moduleModel->getQuickCreateUrl()}" href="javascript:void(0)">{vtranslate($singularLabel,$moduleName)}</a>
                                                                </div>
                                                                {if $count % 3 == 2}
                                                                </div>
                                                            {/if}
                                                            {assign var='count' value=$count+1}
                                                        {/if}
                                                    {/if}
                                                {/foreach}
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                    </li>

                    {foreach key=index item=obj from=$HEADER_LINKS}
                        {assign var="src" value=$obj->getIcon()}
                        {assign var="icon" value=$obj->getIcon()}
                        {assign var="title" value=$obj->getLabel()}
                        {assign var="childLinks" value=$obj->getChildLinks()}
                        <!-- user login dropdown start-
                        <li class="dropdown">
                            {if !empty($src)}
                                <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                    {$src}
                                </a>
                            {else}
                            {/if}
                            {if !empty($childLinks) && empty($src)}
                                <ul class="dropdown-menu extended logout">
                                    <div class="log-arrow-up"></div>
                                    <li>
                                        <a href="{$USER_MODEL->getPreferenceDetailViewUrl()}"><i class=" fa fa-suitcase"></i>Profile</a>
                                    </li>
                                    <li>
                                        <a href="{$USER_MODEL->getPreferenceDetailViewUrl()}"><i class="fa fa-cog"></i> Preferences</a>
                                    </li>
                                    <li>
                                        <a href="#"><i class="fa fa-bell-o"></i> Notification</a>
                                    </li>
                                    <li>
                                        <a href="index.php?module=Users&parent=Settings&action=Logout"><i class="fa fa-key"></i> Log Out</a>
                                    </li>
                                </ul>
                                {else}
                                <ul class="dropdown-menu extended">
                                    {foreach key=index item=obj from=$childLinks}
                                                {if $obj->getLabel() eq NULL}
                                                    <li class="divider">&nbsp;</li>
                                                {else}
                                                    {assign var="id" value=$obj->getId()}
                                                    {assign var="href" value=$obj->getUrl()}
                                                    {assign var="label" value=$obj->getLabel()}
                                                    {assign var="onclick" value=""}
                                                    {if stripos($obj->getUrl(), 'javascript:') === 0}
                                                        {assign var="onclick" value="onclick="|cat:$href}
                                                        {assign var="href" value="javascript:;"}
                                                    {/if}
                                                    <li>
                                                        <a target="{$obj->target}" id="menubar_item_right_{Vtiger_Util_Helper::replaceSpaceWithUnderScores($label)}"  href="{$href}" {$onclick}>{vtranslate($label,$MODULE)}</a>
                                                    </li>
                                                {/if}
                                    {/foreach}
                                </ul>
                            {/if}
                        </li>
                        <!-- user login dropdown end 
                    {/foreach}
                </ul>
                <!--search & user info end-->
            </div>-->*}
            <div class="top-nav pull-right">
                <ul class="nav pull-right top-menu">{foreach key=index item=obj from=$HEADER_LINKS}
                        {assign var="src" value=$obj->getIcon()}
                        {assign var="icon" value=$obj->getIcon()}
                        {assign var="title" value=$obj->getLabel()}
                        {assign var="childLinks" value=$obj->getChildLinks()}
                    <li class="dropdown pull-right">
                            {if !empty($src)}

                            {else}
                                {assign var=title value=$USER_MODEL->get('first_name')}
                                {if empty($title)}
                                    {assign var=title value=$USER_MODEL->get('last_name')}
                                {/if}       
                                <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                    {assign var=CURRENT_USER_MODEL value=Users_Record_Model::getCurrentUserModel()}
                                    {foreach key=ITER item=IMAGE_INFO from=$CURRENT_USER_MODEL->getImageDetails()}
                                    {if !empty($IMAGE_INFO.path) && !empty({$IMAGE_INFO.orgname})}
                                    <img alt="" src="{$IMAGE_INFO.path}_{$IMAGE_INFO.orgname}" style="height:20px">
                                    {else}
                                    <img src="{vimage_path('default_user.jpg')}" alt="" title="" data-image-id=""style="height:20px">
                                    {/if}
                                    {/foreach}
                                    <span class="username">{$title}</span>
                                    <b class="caret"></b>
                                </a>
                            {/if}
                            {if !empty($childLinks) && empty($src)}
                                <ul class="dropdown-menu extended logout">
                                    <div class="log-arrow-up"></div>
                                    <li>
                                        <a href="{$USER_MODEL->getPreferenceDetailViewUrl()}"><i class=" fa fa-suitcase"></i>Profile</a>
                                    </li>
                                    <li>
                                        <a href="{$USER_MODEL->getPreferenceDetailViewUrl()}"><i class="fa fa-cog"></i> Preferences</a>
                                    </li>
                                    <li>
                                        <a href="#"><i class="fa fa-bell-o"></i> Notification</a>
                                    </li>
                                    <li>
                                        <a href="index.php?module=Users&parent=Settings&action=Logout"><i class="fa fa-key"></i> Log Out</a>
                                    </li>
                                </ul>
                                {else}
                                <ul class="dropdown-menu extended">
                                    {foreach key=index item=obj from=$childLinks}
                                                {if $obj->getLabel() eq NULL}
                                                    <li class="divider">&nbsp;</li>
                                                {else}
                                                    {assign var="id" value=$obj->getId()}
                                                    {assign var="href" value=$obj->getUrl()}
                                                    {assign var="label" value=$obj->getLabel()}
                                                    {assign var="onclick" value=""}
                                                    {if stripos($obj->getUrl(), 'javascript:') === 0}
                                                        {assign var="onclick" value="onclick="|cat:$href}
                                                        {assign var="href" value="javascript:;"}
                                                    {/if}
                                                    <li>
                                                        <a target="{$obj->target}" id="menubar_item_right_{Vtiger_Util_Helper::replaceSpaceWithUnderScores($label)}"  href="{$href}" {$onclick}>{vtranslate($label,$MODULE)}</a>
                                                    </li>
                                                {/if}
                                    {/foreach}
                                </ul>
                            {/if}
                    </li>
                    {/foreach}
                </ul>
            </div>
    <input type='hidden' value="{$MODULE}" id='module' name='module'/>
    <input type="hidden" value="{$PARENT_MODULE}" id="parent" name='parent' />
    <input type='hidden' value="{$VIEW}" id='view' name='view'/>  
      
{/strip}
