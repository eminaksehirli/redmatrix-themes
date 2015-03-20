{{if $item.comment_firstcollapsed}}
<div class="hide-comments-outer fakelink" onclick="showHideComments({{$item.id}});">
	<span id="hide-comments-{{$item.id}}" class="hide-comments">{{$item.hide_text}}</span>&nbsp;<span id="hide-comments-total-{{$item.id}}" class="hide-comments-total">{{$item.num_comments}}</span>
</div>
<div id="collapsed-comments-{{$item.id}}" class="collapsed-comments" style="display: none;">
{{/if}}
	<div id="thread-wrapper-{{$item.id}}" class="thread-wrapper {{$item.toplevel}}">
		<a name="{{$item.id}}" ></a>
		<div class="wall-item-outside-wrapper {{$item.indent}}{{$item.previewing}}" id="wall-item-outside-wrapper-{{$item.id}}" >
			<div class="wall-item-content-wrapper {{$item.indent}}" id="wall-item-content-wrapper-{{$item.id}}" style="clear:both;">
				<div class="wall-item-info" id="wall-item-info-{{$item.id}}" >
					<div class="wall-item-photo-wrapper{{if $item.owner_url}} wwfrom{{/if}} dropdown" id="wall-item-photo-wrapper-{{$item.id}}">
						<a data-toggle="dropdown" href="#" title="{{$item.linktitle}}" class="wall-item-photo-link" id="wall-item-photo-link-{{$item.id}}"><img src="{{$item.thumb}}" class="wall-item-photo{{$item.sparkle}}" id="wall-item-photo-{{$item.id}}" alt="{{$item.name}}" /></a>
						<!--
						<a href="{{$item.profile_url}}" title="{{$item.linktitle}}" class="wall-item-photo-link" id="wall-item-photo-link-{{$item.id}}"><img src="{{$item.thumb}}" class="wall-item-photo{{$item.sparkle}}" id="wall-item-photo-{{$item.id}}" alt="{{$item.name}}" /></a>
						-->
						<ul class="dropdown-menu" role="menu" aria-labelledby="wall-item-photo-link-{{$item.id}}">
							<li role="presentation"><a role="menuitem" href="{{$item.profile_url}}" title="{{$item.linktitle}}"  id="wall-item-photo-link-{{$item.id}}">{{$item.name}}</a></li>
							<li role="presentation">
								<a role="menuitem">
								{{if $item.verified}}<i class="icon-ok item-verified" title="{{$item.verified}}"></i>&nbsp;{{elseif $item.forged}}<i class="icon-exclamation item-forged" title="{{$item.forged}}"></i>&nbsp;{{/if}}<span class="autotime" title="{{$item.isotime}}">{{$item.localtime}}{{if $item.editedtime}}&nbsp;{{$item.editedtime}}{{/if}}{{if $item.expiretime}}&nbsp;{{$item.expiretime}}{{/if}}</span>{{if $item.editedtime}}&nbsp;<i class="icon-pencil"></i>{{/if}}&nbsp;{{if $item.app}}<span class="item.app">{{$item.str_app}}</span>{{/if}}
								</a>
							</li>
							{{if $item.location}}
							<li role="presentation">
								{{$item.location}}
							</li>
							{{/if}}
						</ul>
					</div>
					<div class="wall-item-photo-end" style="clear:both">
					</div>
				</div>
				{{if $item.title}}
				<div class="wall-item-title" id="wall-item-title-{{$item.id}}">
				<h3>{{if $item.title_tosource}}{{if $item.plink}}<a href="{{$item.plink.href}}" title="{{$item.title}} ({{$item.plink.title}})">{{/if}}{{/if}}{{$item.title}}{{if $item.title_tosource}}{{if $item.plink}}</a>{{/if}}{{/if}}</h3>
				</div>
				{{/if}}
				{{if $item.lock}}
				<div class="wall-item-lock dropdown">
					<i class="icon-lock lockview dropdown-toggle" data-toggle="dropdown" title="{{$item.lock}}" onclick="lockview(event,{{$item.id}});" ></i><ul id="panel-{{$item.id}}" class="lockview-panel dropdown-menu"></ul>&nbsp;
				</div>
				{{/if}}
				<div class="wall-item-author">
					<a href="{{$item.profile_url}}" title="{{$item.linktitle}}" class="wall-item-name-link"><span class="wall-item-name{{$item.sparkle}}" id="wall-item-name-{{$item.id}}" >{{$item.name}}</span></a>{{if $item.owner_url}}&nbsp;{{$item.via}}&nbsp;<a href="{{$item.owner_url}}" title="{{$item.olinktitle}}" class="wall-item-name-link"><span class="wall-item-name{{$item.osparkle}}" id="wall-item-ownername-{{$item.id}}">{{$item.owner_name}}</span></a>{{/if}}
				</div>
				<div class="wall-item-ago"  id="wall-item-ago-{{$item.id}}">
					{{if $item.verified}}<i class="icon-ok item-verified" title="{{$item.verified}}"></i>&nbsp;{{elseif $item.forged}}<i class="icon-exclamation item-forged" title="{{$item.forged}}"></i>&nbsp;{{/if}}{{if $item.location}}<span class="wall-item-location" id="wall-item-location-{{$item.id}}">{{$item.location}},&nbsp;</span>{{/if}}<a href="{{$item.plink.href}}"><span class="autotime" title="{{$item.isotime}}">{{$item.localtime}}{{if $item.editedtime}}&nbsp;{{$item.editedtime}}{{/if}}{{if $item.expiretime}}&nbsp;{{$item.expiretime}}{{/if}}</span></a>{{if $item.editedtime}}&nbsp;<i class="icon-pencil"></i>{{/if}}&nbsp;{{if $item.app}}<span class="item.app">{{$item.str_app}}</span>{{/if}}
				</div>
				<div class="wall-item-content" id="wall-item-content-{{$item.id}}">
					<div class="wall-item-title-end"></div>
					<div class="wall-item-body" id="wall-item-body-{{$item.id}}" >
						{{$item.body}}
						{{if $item.tags}}
						<div class="body-tag">
						{{foreach $item.tags as $tag}}
							<span class='tag'>{{$tag}}</span>
						{{/foreach}}
						</div>
						{{/if}}
						{{if $item.has_cats}}
						<div class="categorytags">
							<span>{{$item.txt_cats}} {{foreach $item.categories as $cat}}{{$cat.name}} <a href="{{$cat.removeurl}}" title="{{$remove}}">[{{$remove}}]</a> {{if $cat.last}}{{else}}, {{/if}}{{/foreach}}
						</div>
						{{/if}}
							{{if $item.has_folders}}
						<div class="filesavetags">
							<span>{{$item.txt_folders}} {{foreach $item.folders as $cat}}{{$cat.name}} <a href="{{$cat.removeurl}}" title="{{$remove}}">[{{$remove}}]</a> {{if $cat.last}}{{else}}, {{/if}}{{/foreach}}
						</div>
						{{/if}}
					</div>
				</div>
				<div class="wall-item-tools">
					{{if $item.responses }}
					<div class="wall-item-tools-left{{if $item.responses.count > 1}} btn-group{{/if}}">
					{{foreach $item.responses as $verb=>$response}}
						{{if $response.count}}
						<div class="btn-group">
							<button type="button" class="btn btn-default btn-sm wall-item-like dropdown-toggle" data-toggle="dropdown" class="wall-item-tool-response" id="wall-item-{{$verb}}-{{$item.id}}">{{$response.count}} {{$response.button}}</button>
							{{if $response.list_part}}
							<ul class="dropdown-menu" role="menu" aria-labelledby="wall-item-{{$verb}}-{{$item.id}}">{{foreach $response.list_part as $liker}}<li role="presentation">{{$liker}}</li>{{/foreach}}</ul>
							{{else}}
							<ul class="dropdown-menu" role="menu" aria-labelledby="wall-item-{{$verb}}-{{$item.id}}">{{foreach $response.list as $liker}}<li role="presentation">{{$liker}}</li>{{/foreach}}</ul>
							{{/if}}
							{{if $response.list_part}}
							<div class="modal" id="{{$verb}}Modal-{{$item.id}}">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
											<h4 class="modal-title">{{$response.title}}</h4>
										</div>
										<div class="modal-body">
										<ul>{{foreach $response.list as $liker}}<li role="presentation">{{$liker}}</li>{{/foreach}}</ul>
										</div>
										<div class="modal-footer clear">
											<button type="button" class="btn btn-default" data-dismiss="modal">{{$item.modal_dismiss}}</button>
										</div>
									</div><!-- /.modal-content -->
								</div><!-- /.modal-dialog -->
							</div><!-- /.modal -->
							{{/if}}
						</div>
						{{/if}}
					{{/foreach}}
					</div>
					{{/if}}
					<div class="wall-item-tools-right btn-group">
						{{if $item.like}}
						<!--
						<a title="{{$item.like.0}}" class="wall-item-tools-text" onclick="dolike({{$item.id}},'like'); return false;" href="#">Like</a>
						-->
						<button type="button" title="{{$item.like.0}}" class="btn btn-default btn-sm" onclick="dolike({{$item.id}},'like'); return false;">
							<i class="icon-thumbs-up-alt" ></i>
						</button>
						{{/if}}
						{{if $item.dislike}}
						<!--
						<a title="{{$item.dislike.0}}" class="wall-item-tools-text" onclick="dolike({{$item.id}},'dislike'); return false;" href="#">Dislike</a>
						-->
<button type="button" title="{{$item.dislike.0}}" class="btn btn-default btn-sm" onclick="dolike({{$item.id}},'dislike'); return false;">
							<i class="icon-thumbs-down-alt" ></i>
						</button>
						{{/if}}
						{{if $item.isevent}}
						<button type="button" title="{{$item.attend.0}}" class="btn btn-default btn-sm" onclick="itemAddToCal({{$item.id}}); dolike({{$item.id}},'attendyes'); return false;">
							<i class="icon-ok" ></i>
						</button>
						<button type="button" title="{{$item.attend.1}}" class="btn btn-default btn-sm" onclick="dolike({{$item.id}},'attendno'); return false;">
							<i class="icon-remove" ></i>
						</button>
						<button type="button" title="{{$item.attend.2}}" class="btn btn-default btn-sm" onclick="itemAddToCal({{$item.id}}); dolike({{$item.id}},'attendmaybe'); return false;">
							<i class="icon-question" ></i>
						</button>
						{{/if}}

						{{if $item.canvote}}
						<button type="button" title="{{$item.conlabels.0}}" class="btn btn-default btn-sm" onclick="dolike({{$item.id}},'agree'); return false;">
							<i class="icon-ok" ></i>
						</button>
						<button type="button" title="{{$item.conlabels.1}}" class="btn btn-default btn-sm" onclick="dolike({{$item.id}},'disagree'); return false;">
							<i class="icon-remove" ></i>
						</button>
						<button type="button" title="{{$item.conlabels.2}}" class="btn btn-default btn-sm" onclick="dolike({{$item.id}},'abstain'); return false;">
							<i class="icon-question" ></i>
						</button>
						{{/if}}
						<!--
						<a data-toggle="dropdown" class="wall-item-tools-text" id="wall-item-menu-{{$item.id}}" href="#">More</a>
						-->
						<button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" id="wall-item-menu-{{$item.id}}">
							<i class="icon-caret-down"></i>
						</button>
						<ul class="dropdown-menu" role="menu" aria-labelledby="wall-item-menu-{{$item.id}}">
							{{if $item.share}}
							<li role="presentation"><a role="menuitem" href="#" onclick="jotShare({{$item.id}}); return false"><i class="icon-retweet" title="{{$item.share.0}}"></i> {{$item.share.0}}</a></li>
							{{/if}}
							{{if $item.plink}}
							<li role="presentation"><a role="menuitem" href="{{$item.plink.href}}" title="{{$item.plink.title}}" ><i class="icon-external-link"></i> {{$item.plink.title}}</a></li>
							{{/if}}
							{{if $item.edpost}}
							<li role="presentation"><a role="menuitem" href="{{$item.edpost.0}}" title="{{$item.edpost.1}}"><i class="editpost icon-pencil"></i> {{$item.edpost.1}}</a></li>
							{{/if}}
							{{if $item.tagger}}
							<li role="presentation"><a role="menuitem" href="#"  onclick="itemTag({{$item.id}}); return false;"><i id="tagger-{{$item.id}}" class="icon-tag" title="{{$item.tagger.tagit}}"></i> {{$item.tagger.tagit}}</a></li>
							{{/if}}
							{{if $item.filer}}
							<li role="presentation"><a role="menuitem" href="#" onclick="itemFiler({{$item.id}}); return false;"><i id="filer-{{$item.id}}" class="icon-folder-open" title="{{$item.filer}}"></i> {{$item.filer}}</a></li>
							{{/if}}
							{{if $item.bookmark}}
							<li role="presentation"><a role="menuitem" href="#" onclick="itemBookmark({{$item.id}}); return false;"><i id="bookmarker-{{$item.id}}" class="icon-bookmark" title="{{$item.bookmark}}"></i> {{$item.bookmark}}</a></li>
							{{/if}}
							{{if $item.addtocal}}
							<li role="presentation"><a role="menuitem" href="#" onclick="itemAddToCal({{$item.id}}); return false;"><i id="addtocal-{{$item.id}}" class="icon-calendar" title="{{$item.addtocal}}"></i> {{$item.addtocal}}</a></li>
							{{/if}}
							{{if $item.star}}
							<li role="presentation"><a role="menuitem" href="#" onclick="dostar({{$item.id}}); return false;"><i id="starred-{{$item.id}}" class="icon-star {{$item.star.isstarred}}" title="{{$item.star.toggle}}"></i> {{$item.star.toggle}}</a></li>
							{{/if}}
							{{if $item.item_photo_menu}}
							<li role="presentation" class="divider"></li>
							{{$item.item_photo_menu}}
							{{/if}}
							{{if $item.drop.dropping}}
							<li role="presentation" class="divider"></li>
							<li role="presentation"><a role="menuitem" href="item/drop/{{$item.id}}" onclick="return confirmDelete();" title="{{$item.drop.delete}}" ><i class="icon-trash"></i> {{$item.drop.delete}}</a></li>
							{{/if}}
						</ul>
					</div>
					<div id="like-rotator-{{$item.id}}" class="like-rotator"></div>
				</div>
				<div class="clear"></div>
			</div>
			<div class="wall-item-wrapper-end"></div>
			<div class="wall-item-outside-wrapper-end {{$item.indent}}" ></div>
		</div>
		{{if $item.toplevel}}
		{{foreach $item.children as $child}}
			{{include file="{{$child.template}}" item=$child}}
		{{/foreach}}
		{{/if}}
		{{if $item.comment}}
		<div class="wall-item-comment-wrapper{{if $item.children}} wall-item-comment-wrapper-wc{{/if}}" >
			{{$item.comment}}
		</div>
		<div id="comment-edit-preview-{{$item.id}}" class="comment-edit-preview"></div>
		<div class="clear"></div>
		{{/if}}
	</div>
{{if $item.comment_lastcollapsed}}
</div>
{{/if}}
