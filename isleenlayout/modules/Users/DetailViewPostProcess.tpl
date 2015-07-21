{strip}
{assign var="MODULE_NAME" value=$MODULE_MODEL->get('name')}

    </div>
  </form>
</div>
      <div class="related marginLeftZero">
        <aside class="profile-nav col-lg-12">
          <section class="panel">
            <div class="user-heading round">
              <a href="#">
              {foreach key=ITER item=IMAGE_INFO from=$CURRENT_USER_MODEL->getImageDetails()}
                {if !empty($IMAGE_INFO.path) && !empty($IMAGE_INFO.orgname)}
                <img src="{$IMAGE_INFO.path}_{$IMAGE_INFO.orgname}" alt="{$IMAGE_INFO.orgname}" title="{$IMAGE_INFO.orgname}" data-image-id="{$IMAGE_INFO.id}">
                {else}
                <img src="{vimage_path('default_user.jpg')}" alt="" title="" data-image-id="">
                {/if}
              {/foreach}
              </a>
              <h1>{$CURRENT_USER_MODEL->get('first_name')} {$CURRENT_USER_MODEL->get('last_name')}</h1>
              <p>{$CURRENT_USER_MODEL->get('email1')}</p>
            </div>

            <ul class="nav nav-pills nav-stacked">
              <li {if $MODULE eq "Users" && $VIEW eq "Updates"}class="active"{/if}>
                <a href="index.php?module=Users&view=Updates"> 
                  <i class="fa fa-user"></i> Updates
                  <span class="label label-danger pull-right r-activity">9</span>
                </a>
              </li>
              <li>
                <a href="{$USER_MODEL->getPreferenceDetailViewUrl()}"> <i class="fa fa-calendar"></i>Profile</a>
              </li>
            </ul>

          </section>
        </aside>
      </div>
    </div>
  </section>
</section>
{/strip}