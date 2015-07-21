<h1>
	{$UPDATE->getParent()->getDisplayValue('title')}
<br>{$UPDATE->getParent()->getDisplayValue('parent_id')}
</h1>
<div class="desk">
	<a href="{$UPDATE->getParent()->getDetailViewUrl()}" >
	<h3 style="color:{$UPDATE->getParent()->getModule()->getColor()}">{$UPDATE->getParent()->getName()}</h3>
	</a>
</div>
          
