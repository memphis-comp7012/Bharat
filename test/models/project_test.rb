# == Schema Information
#
# Table name: projects
#
#  id               :integer          not null, primary key
#  name             :string
#  status           :integer
#  description      :string
#  start_date       :date
#  end_date         :date
#  funding          :decimal(10, 2)
#  difficulty_level :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  department_id    :integer
#  user_id          :integer
#



require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
	setup :initialize_test_data

	test "Name attribute with length more than 225 characters should be invalid" do
		megha = projects(:megha)
		megha.name = "TestingTestingTestingTestingTestingTestingTestingTestingTestingTestingTestingTestingTestingTestingTestingTestingTestingTestingTestingTestingTestingTestingTestingTestingTestingTestingTestingTestingTestingTestingTestingTestingTestingTestingTestingTesting"
		assert megha.invalid?
	end

	test "Projects with nil name should be invalid" do
		megha = projects(:megha)
		megha.name = nil
		assert megha.invalid?
	end

	test "Projects with no name should be invalid" do
		megha = projects(:megha)
		megha.name = ''
		assert megha.invalid?
	end

	test "Projects with space as name should be invalid" do
		megha = projects(:megha)
		megha.name = ' '
		assert megha.invalid?
	end

	test "Status with nil value should be invalid" do
		megha = projects(:megha)
		megha.status = nil
		assert megha.invalid?
	end

	test "should ensure status enum has the right indices" do
	    @valid_statuses.each_with_index do |status, index|
	      assert_same Project.statuses[status], index
	    end
  	end

  	test "should ensure status does not allow invalid enum values" do
    	@invalid_statuses.each_with_index do |status, index|
      		assert_not_same Project.statuses[status], index
    	end
  	end

	test "Description with nil value should be be invalid" do
		megha = projects(:megha)
		megha.description = nil
		assert megha.invalid?
	end

	test "Description with space only as character should be invalid" do
		megha = projects(:megha)
		megha.description = ' '
		assert megha.invalid?
	end

	test "Description with length more than 3000 should be invalid" do
		megha = projects(:megha)
		megha.description = 'qqwwwProin faucibus eros quis arcu ultricies, quis hendrerit diam interdum. Proin volutpat leo in efficitur tincidunt. Proin eros orci, consequat a gravida sed, imperdiet in nibh. Cras dictum laoreet arcu at ultricies. Integer nec metus porta, tristique orci quis, congue leo. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Cras tincidunt risus at leo efficitur, vitae sagittis orci pellentesque. Suspendisse vel odio interdum, hendrerit dui a, euismod tortor. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam lacinia quam non ligula ultrices vestibulum. Praesent facilisis tristique vestibulum. Cras eu orci massa.Praesent sed arcu sit amet urna porttitor ultrices ac interdum dolor. Sed hendrerit nisi et nisl rutrum dapibus. Phasellus interdum pharetra gravida. Duis eget aliquam sem. Duis porta, velit eget eleifend malesuada, dolor massa volutpat leo, eget pretium magna massa ut odio. Nam id euismod lectus. Duis diam ipsum, efficitur in faucibus et, sollicitudin sit amet elit. Suspendisse ante turpis, congue sed tortor at, mollis ultricies eros. Sed nec egestas magna. Sed blandit risus nulla, eget maximus eros scelerisque eu. Aenean id diam dolor. Mauris ultrices condimentum mi vitae bibendum.In dictum pulvinar ex, at tempor dolor dictum sit amet. Sed varius quis enim id efficitur. Donec eleifend nunc ac ligula posuere semper. Duis ut elit arcu. Curabitur laoreet purus eget felis scelerisque consectetur. Ut mattis nec sapien at placerat. Phasellus et quam dignissim, maximus ante cursus, maximus justo. Aliquam pulvinar velit mollis nisi aliquam congue ac et ligula. Morbi non eros ultrices, pulvinar orci sit amet, tempor nunc. Etiam egestas sit amet nulla at tincidunt. Morbi massa est, tincidunt eget convallis vitae, pretium quis turpis. Nulla ullamcorper, nibh vel dapibus consequat, neque odio tempus nunc, vel consectetur diam libero a felis. Duis non orci pellentesque, aliquam nulla in, rhoncus velit.Nunc sit amet enim arcu. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vivamus ornare, odio vitae convallis rutrum, nibh lorem pulvinar sem, id tempus quam lectus eu massa. Aenean quis tristique tellus, in luctus lectus. Mauris aliquet dolor non leo consequat scelerisque. Phasellus ac ultricies sem, non vulputate ligula. Vivamus ac enim erat. Integer quis mattis felis, non egestas est. Morbi consectetur, nunc vitae cursus tristique, neque erat dapibus turpis, sit amet lobortis tortor purus sit amet magna. Sed ut efficitur dolor. Praesent accumsan mauris ut ipsum tempus luctus. Nulla semper efficitur mattis. Nullam lobortis augue eget diam elementum, et placerat arcu finibus.Nam convallis ipsum placerat ipsum pharetra egestas. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque nibh magna, vestibulum at dapibus nec, maximus ac ipsum. Sed et nisi lectus. Donec congue quam sem, a tincidunt erat suscipit id. Proin varius nibh a faucibus vestibulum. Nulla malesuada sit amet sem sit amet elementum. Vestibulum imperdiet purus at feugiat tincidunt.Nam dignissim augue non augue dictum commodo. Maecenas a ligula feugiat, consequat dolor sit amet, fringilla ex. Donec fermentum risus lorem, ut mollis turpis dictum a. Proin vel pretium dui. Cras sed auctor diam. Mauris eget dignissim arcu. Sed tristique non nunc eu commodo. Morbi venenatis neque in lectus euismod, id suscipit orci blandit. Sed non justo lacinia, sollicitudin orci a, porta tellus. Vestibulum porta pellentesque mauris non posuere. Duis nisi odio, maximus at nisl eget, bibendum sagittis diam.Nulla cursus lectus in ante varius, ut lobortis metus cursus. Aenean in congue massa. Proin aliquet venenatis enim vitae convallis. Praesent condimentum cursus elit, vel finibus nibh gravida a. Curabitur felis lacus, porttitor ut placerat quis, mollis sed sapien. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Pellentesque urna massa, vestibulum ac blandit at, eleifend eget neque. Cras leo quam, gravida fringilla vulputate id, aliquet vel tellus.Donec ex orci, ornare commodo porttitor vitae, sagittis non magna. Nam in gravida ante. Etiam luctus quam ligula, a egestas nunc hendrerit eget. Sed vulputate in nisi elementum ullamcorper. Etiam ligula lectus, dapibus sit amet risus at, ultrices aliquam augue. Cras posuere justo sit amet magna consequat rutrum. Sed bibendum ornare ipsum in ultricies. Sed porttitor sed lectus in imperdiet. Aenean nisi eros, pellentesque ut tristique sit amet, interdum eu diam. Sed maximus vulputate nunc, nec pretium ante condimentum nec. Phasellus magna arcu, scelerisque quis scelerisque ac, vehicula nec eros. Integer sed orci vel justo ultrices varius.Sed finibus consequat placerat. Aenean arcu felis, dapibus et consequat eu, pharetra eget quam. Etiam ullamcorper lectus quis sem finibus convallis. Nulla non purus at mi convallis rutrum. Nam cursus, lectus quis scelerisque porttitor, est massa dapibus libero, sit amet sagittis tellus orci nec magna. Aenean eleifend mattis justo id viverra. Vivamus rhoncus, sem vitae lacinia tincidunt, purus elit faucibus nisl, at aliquam eros felis eu elit. Vivamus volutpat libero ut ante pulvinar laoreet. Aliquam nec faucibus nibh. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec a urna eu eros iaculis scelerisque. Vestibulum massa ligula, aliquet vel massa tempor, tristique tristique lectus. Pellentesque consequat ullamcorper risus, quis gravida ex. Sed eu tortor vestibulum, accumsan arcu sit amet, dignissim urna. Duis semper magna metus, at lobortis dui accumsan vel. Integer sagittis ultrices nulla eget tempor.Cras sit amet scelerisque leo, ac varius ante. Phasellus quis est accumsan est dictum fermentum rhoncus eget leo. Curabitur feugiat varius est ac pharetra. Donec fermentum, sapien ut tincidunt mattis, nulla ipsum dapibus ex, at semper sapien enim nec nisi. Aenean ligula massa, consequat at ipsum nec, semper mollis mi. Phasellus lacinia vulputate nibh at feugiat. Nulla luctus, dui ut consequat efficitur, ex odio porttitor orci, eget viverra diam felis vitae sem. Suspendisse in fermentum mi, quis tincidunt libero. Suspendisse interdum interdum odio eu vulputate. Duis lacinia maximus nisi at iaculis. Maecenas nec justo in nunc lacinia scelerisque sit amet sit amet arcu. Nullam bibendum odio urna, non efficitur purus interdum a. Fusce lobortis hendrerit tortor, in bibendum eros luctus eget. Phasellus eu ante augue. Curabitur felis metus, feugiat posuere blandit id, tincidunt non quam.Vivamus accumsan elit dolor, non fermentum leo rutrum eu. Proin tortor enim, semper quis ligula vitae, pulvinar dapibus arcu. Morbi eget lacus ut sem cursus iaculis id nec enim. Curabitur vel lacus ac felis luctus ultrices. Proin volutpat scelerisque magna, in cursus lectus rhoncus sit amet. Pellentesque dolor eros, venenatis non turpis vel, blandit luctus diam. Vestibulum sagittis nunc elit, sed faucibus sapien finibus in. Nunc volutpat dui sed sapien dapibus, interdum consequat mi vehicula. Donec in dui odio. Sed sollicitudin augue id arcu malesuada pellentesque. Mauris commodo neque in iaculis vestibulum.Maecenas ac sapien ipsum. Maecenas auctor turpis in ex sodales accumsan. Quisque feugiat metus ligula, a consectetur mi pharetra at. Proin tincidunt mi sit amet lorem auctor, ut aliquam lorem cursus. Phasellus porta, velit vitae efficitur tincidunt, metus turpis volutpat metus, sit amet mattis lacus urna quis eros. Nam pretium pulvinar consectetur. Sed laoreet mattis convallis. Vivamus pulvinar congue justo non varius. Morbi vitae ullamcorper ex. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Ut ullamcorper gravida interdum. Nam pellentesque urna condimentum, sagittis felis eu, tincidunt tellus. Quisque mattis in lectus vitae volutpat. Duis porta placerat ex a imperdiet. Proin et augue quis ante consequat scelerisque.Vestibulum non vehicula velit. Nam scelerisque ex id magna porttitor, et dictum odio pulvinar. Sed sodales purus arcu, faucibus malesuada enim posuere ac. Integer justo nibh, laoreet ac mauris at, viverra auctor urna. Nunc at placerat nibh. Nulla auctor ante enim, eget molestie sem semper ut. Curabitur aliquam nunc nec lacus suscipit sollicitudin. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a blandit odio. Donec leo nulla, consequat ut imperdiet at, consequat id mi. Quisque dapibus enim sed ullamcorper luctus. Phasellus congue velit sit amet erat accumsan, a tincidunt metus facilisis. In hac habitasse platea dictumst. Proin consequat sit amet libero non sodales. Nulla auctor ornare urna eget aliquam. Etiam eu vestibulum ipsum.Aenean et tincidunt elit. In porta, leo ac dapibus luctus, nisl augue facilisis ante, sit amet dapibus velit purus vel dolor. Proin et diam justo. Duis sed lacus odio. Integer sed feugiat nisl, iaculis ullamcorper sem. In lacus erat, varius pharetra ante ac, commodo varius metus. Aliquam volutpat condimentum arcu, ut molestie nibh dignissim dignissim. Morbi tempus felis commodo, mattis sem a, sollicitudin diam. Praesent lectus justo, efficitur et aliquam vitae, lacinia et nunc. Suspendisse vel felis sit amet lorem fermentum auctor et et quam. Sed blandit felis sed tincidunt gravida. Quisque vehicula iaculis nisl in aliquet. Suspendisse potenti. Nunc in elit bibendum, dictum ligula tempor, faucibus eros.Praesent posuere, diam et convallis sagittis, lacus orci interdum mauris, eu blandit ligula lorem sit amet ligula. Sed feugiat, mauris quis sodales rhoncus, augue urna molestie purus, in finibus erat odio quis nisi. Donec quis tortor sem. Mauris ipsum metus, auctor sagittis ultrices sit amet, cursus eget purus. Nulla eu nibh ac ex ultricies auctor eu ac ante. Sed sagittis quis felis non hendrerit. Morbi quis nunc vitae nibh bibendum fringilla. Pellentesque ultricies fringilla placerat. Sed condimentum, sem vitae convallis ullamcorper, tortor sapien vulputate odio, eu pretium mi nulla vel magna. Nullam efficitur vehicula dui, porta pulvinar sapien dictum vitae. Curabitur vel odio pulvinar, accumsan arcu et, consectetur elit. Mauris cursus, turpis sit amet iaculis elementum, quam massa posuere mi, vel sodales mauris arcu vehicula ex. Phasellus sollicitudin, ante ac aliquet cursus, lorem ligula lacinia tellus, quis scelerisque sem risus convallis lorem. Phasellus purus mauris, aliquam molestie est pharetra, pulvinar commodo lectus. Proin facilisis dui et erat sollicitudin eleifend.Curabitur eu fringilla risus. Cras sollicitudin est quis vestibulum fermentum. Ut ut maximus urna. Nunc interdum auctor mi, in tincidunt orci pretium et. Praesent euismod a ex sit amet tempor. Etiam sit amet sollicitudin augue, sit amet dictum ante. Suspendisse efficitur sollicitudin gravida.Pellentesque fringilla, ligula pellentesque imperdiet interdum, orci nulla hendrerit ipsum, vel vulputate eros ante nec tellus. Curabitur eleifend tellus ac nibh maximus tempor. Suspendisse nec ullamcorper dolor. Vestibulum non massa fringilla, mattis orci non, tristique urna. In ac risus ex. Suspendisse potenti. Cras tempus massa urna, eu ultrices sem pulvinar in. Proin mollis risus eget lacinia luctus. Sed consectetur pretium metus non ornare. Phasellus tempus quis sem vitae mattis. Etiam congue malesuada enim, ut faucibus orci molestie et. Donec non tincidunt nulla. Sed blandit mauris eu risus mattis, et pellentesque libero tempus. Mauris accumsan eleifend laoreet. Nullam ut fringilla purus.Nullam tristique lacus tortor, quis pulvinar est rutrum eu. Quisque quis turpis ac purus volutpat volutpat quis nec felis. Vestibulum justo nisi, dictum sed odio et, elementum elementum nunc. Sed euismod lectus vitae porttitor aliquet. Sed et dui et ante consectetur elementum. Cras rutrum et sapien sit amet euismod. Curabitur viverra, diam id maximus sagittis, nulla sapien lobortis magna, et dictum ante lorem vitae nibhQuisque vel justo feugiat, dignissim felis et, interdum eros. Etiam ut lectus id metus placerat varius in ut arcu. Cras dictum vel mauris a consequat. Donec auctor euismod faucibus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vestibulum blandit pulvinar blandit. Sed lacinia scelerisque erat, nec suscipit nisl. Duis sollicitudin accumsan rhoncus. Nulla pulvinar gravida sagittis. Phasellus sollicitudin mauris dolor, non ullamcorper dolor fringilla in. Duis a libero ac nibh ultricies dapibus a ac urna. Etiam tristique tellus non augue mollis, vitae malesuada dolor accumsan. Mauris pulvinar porta libero eget tincidunt.Nulla scelerisque fermentum odio. Vestibulum eu magna sed arcu elementum iaculis ut quis ligula. Mauris a nisl sem. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aliquam efficitur sodales sem, ut dignissim erat euismod eu. Nam hendrerit porta risus, ullamcorper condimentum justo auctor id. Pellentesque volutpat, arcu ut pharetra congue, risus diam condimentum sapien, a pretium libero diam aliquam nunc. Vivamus pharetra aliquam turpis, sit amet ultricies sapien interdum eu. In rhoncus aliquet turpis nec blandit. Nulla vehicula, eros at consectetur laoreet, dolor orci mattis mauris, sed convallis sem sapien vitae libero. Etiam porta ornare nunc, ac laoreet arcu luctus a. Sed blandit convallis semper. Nunc iaculis turpis ut posuere malesuada. Quisque scelerisque mi quis orci gravida bibendum. Quisque sollicitudin justo neque, a rutrum neque aliquet sed.Nulla nec felis magna. Duis fermentum ultricies velit vel suscipit. Nulla facilisi. Donec pretium nulla sed dui condimentum, quis sodales urna porttitor. Vivamus interdum arcu eu tellus efficitur, non scelerisque tortor gravida. In a luctus lorem, eu egestas mi. Sed ultrices auctor quam a hendrerit. Nulla erat velit, faucibus vel diam vitae, venenatis maximus nibh. Maecenas blandit ligula scelerisque tempus sagittis.Sed mattis lorem tempus, vehicula velit in, lacinia ante. Aliquam id porta neque, non ullamcorper dolor. Duis lacus arcu, molestie vitae lectus vitae, aliquam laoreet velit. Sed viverra, dui a eleifend tempus, nisl metus tempor felis, ac pretium massa purus sed velit. Nulla facilisi. Maecenas a pharetra tellus, a congue diam. Fusce pharetra, ligula id porta tincidunt, nisl lorem tincidunt orci, eleifend scelerisque erat massa et ante. Pellentesque sit amet ipsum sit amet risus interdum facilisis. Mauris nec cursus dolor. Nullam rutrum mauris eu malesuada congue. Proin dictum nec mauris accumsan aliquet.Nullam eget massa cursus, sagittis leo in, mollis orci. In posuere orci viverra, dignissim diam vel, molestie tellus. Phasellus quam nunc, tempus id justo in, imperdiet placerat erat. Praesent orci eros, pulvinar eget interdum sodales, accumsan ac enim. Proin accumsan orci dictum mauris viverra, eu ultrices justo viverra. Sed sapien nisi, finibus nec neque a, placerat cursus sem. Morbi dui massa, iaculis vitae tempus id, venenatis at enim.Sed nec turpis eget nunc pharetra iaculis eu eget neque. Morbi pulvinar non massa eget aliquet. Duis nec interdum magna, quis tempus turpis. Integer a enim eleifend, tempor ipsum sed, imperdiet metus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Cras aliquet sed est quis vestibulum. Donec a tempor mauris. Donec id consequat elit, in dignissim leo. Aenean efficitur euismod diam. Quisque nibh erat, sagittis a mauris nec, laoreet efficitur sem. Pellentesque euismod, dui sit amet sagittis dictum, erat sapien convallis libero, tempor condimentum felis justo feugiat leo. Maecenas lacinia tortor non nisi scelerisque, a blandit lorem pretium. Vestibulum non dictum odio, eu sodales dui. Quisque semper volutpat sem vel tincidunt. Etiam sit amet ultricies lectus. Quisque aliquet tellus nec ex sodales auctor.Etiam lorem augue, suscipit non finibus ut, ullamcorper a mauris. Etiam scelerisque, sapien in dignissim blandit, ligula dolor auctor mauris, eu pulvinar lacus risus eu odio. Sed finibus consequat erat. Mauris fringilla et elit egestas varius. Nam volutpat fringilla velit luctus tristique. Maecenas leo nibh, molestie id magna eget, malesuada vulputate massa. Sed rutrum elementum gravida. Etiam eget porttitor metus. Vestibulum dapibus lobortis ipsum, eget lacinia quam suscipit eget. Vivamus at ipsum laoreet nibh auctor fermentum. Etiam finibus vel neque eu ullamcorper. Suspendisse sit amet libero enim. Etiam gravida nulla sed diam bibendum fermentum. Nullam malesuada leo quis quam efficitur, eu imperdiet ante faucibus.Mauris eu bibendum quam. Praesent maximus sodales consequat. Fusce id lacinia nibh. Suspendisse a nisl magna. Cras quam lacus, dictum sed volutpat at, malesuada ut erat. Proin scelerisque neque vel diam ornare tempor. Nulla aliquam et nisi quis convallis. In congue, enim nec luctus pulvinar, urna tellus porta metus, sed eleifend odio massa rhoncus nisl. Curabitur gravida aliquet ligula, sit amet rutrum odio iaculis eu. Integer sollicitudin diam vitae convallis commodo. Ut venenatis aliquet tortor, sed interdum diam. Nullam eu fermentum elit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Cras euismod lobortis nulla, eu porta mauris congue ut. In hac habitasse platea dictumst.Nulla a dapibus nunc, vel placerat metus. Sed ut varius sapien. Donec ut erat et urna luctus euismod ac ut lacus. Proin blandit nisi ut ex posuere, sed sodales tellus venenatis. Quisque et sollicitudin libero. Vestibulum sit amet tortor eget magna tempus venenatis. Vivamus magna arcu, porta aliquet finibus vel, rhoncus eget tellus. In sagittis iaculis nisl et dignissim. Suspendisse iaculis eleifend bibendum. Cras aliquet elementum magna, id consectetur enim laoreet in. Nullam dictum libero dui, imperdiet lobortis mi venenatis et. Donec purus justo, luctus in est nec, vulputate posuere tellus. Vivamus viverra dapibus rhoncus.In egestas nibh eget libero tincidunt malesuada. Etiam quis dui nec dui varius euismod vitae non ex. In consectetur facilisis magna, in scelerisque sapien euismod nec. Proin eu blandit libero. Quisque quam eros, imperdiet ac tellus mollis, accumsan porta odio. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Ut ornare nibh et consectetur viverra. Ut ornare vel tortor vitae tincidunt. Duis risus mauris, hendrerit pulvinar arcu at, auctor luctus nisi. Morbi placerat elit in enim volutpat, vitae tempus orci sodales.Nullam vestibulum bibendum posuere. Sed elementum dui mollis nulla commodo blandit. Mauris rhoncus, neque scelerisque porttitor imperdiet, augue enim aliquet enim, non aliquam eros tortor non ante. Aliquam accumsan dui at massa euismod volutpat. Nunc sed accumsan enim, ac pharetra sapien. Mauris dapibus erat ut lacus dictum laoreet. Duis consequat arcu nec massa rhoncus, a egestas metus elementum. Duis tempor pellentesque arcu non scelerisque. Vivamus ut tristique ante. Donec semper molestie nunc, ut tincidunt nunc consequat vitae.Vestibulum quis mattis sem, eleifend laoreet enim. Quisque eleifend justo vel mauris finibus, vel fringilla felis faucibus. Aenean in feugiat lorem. Sed sit amet risus in metus scelerisque sollicitudin eget tincidunt ex. Nunc sed orci dictum, maximus mauris nec, vulputate ipsum. Donec molestie cursus enim vel lobortis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ultrices pharetra nulla, sit amet feugiat nibh sodales in. Etiam ut convallis dui. Morbi sollicitudin quam a odio porttitor commodo. Quisque sollicitudin a est ut porta. Proin massa massa, maximus et semper ut, ornare et quam. Ut vel auctor nisl. Nullam non enim nec nulla ornare ultrices. Nunc ut nulla sit amet sem viverra mollis. Interdum et malesuada fames ac ante ipsum primis in faucibus.Morbi rhoncus ligula eu ultricies lacinia. Maecenas tempus commodo bibendum. Praesent convallis accumsan venenatis. Integer ullamcorper nisi vel mattis accumsan. Etiam id erat sodales, convallis ex at, tempor erat. Suspendisse pretium elit ac aliquam euismod. Morbi eu augue orci. Phasellus non tellus quis lorem venenatis laoreet sed eu diam. Sed at.'
		assert megha.invalid?
	end

	test "Start_date for the projects which is before the current date should be invalid" do
		megha = projects(:megha)
		megha.start_date = Time.now-10.day
		assert megha.invalid?
	end

	test "Start_date cannot be nil" do
		megha = projects(:megha)
		megha.start_date = nil
		assert megha.invalid?
	end

	test "End_date cannot be nil" do
		megha = projects(:megha)
		megha.end_date = nil
		assert megha.invalid?
	end

	test "End_date for the projects before the start_date should be invalid" do
		megha = projects(:megha)
		megha.start_date = Time.now
		megha.end_date = Time.now-10.day
		assert megha.invalid?
	end

	test "Funding value lesser than 0 should be invalid" do
		megha = projects(:megha)
		megha.funding = -10
		assert megha.invalid?
	end

	test "Funding value nil should be invalid" do
		megha = projects(:megha)
		megha.funding = nil
		assert megha.invalid?
	end

	test "Should ensure difficulty level enum has the right indices" do
	    @valid_difficulty_levels.each_with_index do |difficulty_level, index|
	      assert_same Project.difficulty_levels[difficulty_level], index
	    end
  	end

  	test "Difficulty level with value nil should be invalid" do
		megha = projects(:megha)
		megha.difficulty_level = nil
		assert megha.invalid?
	end

  	test "Should ensure difficulty_level does not allow invalid enum values" do
    	@invalid_difficulty_levels.each_with_index do |difficulty_level, index|
      		assert_not_same Project.difficulty_levels[difficulty_level], index
    	end
  	end

	def initialize_test_data
		@valid_statuses = [:not_started, :in_progress, :on_hold, :complete]
    	@invalid_statuses = [:complete, :not_started, :in_progress, :on_hold]
        @valid_difficulty_levels = [:easy, :medium, :hard]
        @invalid_difficulty_levels = [:medium, :hard, :easy]
	end
end
