--ディメンション·ワンダラー
function c62107612.initial_effect(c)
	--damage
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(62107612,0))
	e1:SetType(EFFECT_TYPE_QUICK_O)
	e1:SetProperty(EFFECT_FLAG_PLAYER_TARGET)
	e1:SetCode(EVENT_REMOVE)
	e1:SetRange(LOCATION_HAND)
	e1:SetCondition(c62107612.condition)
	e1:SetCost(c62107612.cost)
	e1:SetTarget(c62107612.target)
	e1:SetOperation(c62107612.operation)
	c:RegisterEffect(e1)
end
function c62107612.condition(e,tp,eg,ep,ev,re,r,rp)
	return re:GetDescription()==aux.Stringid(93717133,0)
end
function c62107612.cost(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.GetFlagEffect(tp,62107612)==0 and e:GetHandler():IsAbleToGraveAsCost() end
	Duel.SendtoGrave(e:GetHandler(),REASON_COST)
	Duel.RegisterFlagEffect(tp,62107612,RESET_PHASE+PHASE_END,EFFECT_FLAG_OATH,1)
end
function c62107612.target(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return true end
	Duel.SetTargetPlayer(1-tp)
	Duel.SetTargetParam(3000)
	Duel.SetOperationInfo(0,CATEGORY_DAMAGE,nil,0,1-tp,3000)
end
function c62107612.operation(e,tp,eg,ep,ev,re,r,rp)
	local p,d=Duel.GetChainInfo(0,CHAININFO_TARGET_PLAYER,CHAININFO_TARGET_PARAM)
	Duel.Damage(p,d,REASON_EFFECT)
end