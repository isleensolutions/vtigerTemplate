<h1>
	{$UPDATE->getParent()->getDisplayValue('vendor_id')}
<br>{$UPDATE->getParent()->getDisplayValue('tracking_no')}
<br>{$UPDATE->getParent()->getDisplayValue('hdnGrandTotal')}
</h1>
<div class="desk">
	<a href="{$UPDATE->getParent()->getDetailViewUrl()}" >
	<h3 style="color:{$UPDATE->getParent()->getModule()->getColor()}">{$UPDATE->getParent()->getName()}</h3>
	</a>
</div>
                    
