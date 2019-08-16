GLOBAL_LIST_INIT(petushiniy_list, list("ambrosiafumari"))

/atom
	var/zashkvareno = 0

/proc/zashkvar_check(var/mob/M, var/atom/A) //nasral na other_mobs.dm
	if(M && M.ckey && !A.zashkvareno && M.ckey in GLOB.petushiniy_list)
		A.zashkvareno = 1
		A.visible_message("<span class='danger'>[A.name] �������������� �� ���������� �������!</span>")
		if(prob(50))
			A.name = "��������� " + A.name
		else
			A.name = "������������ " + A.name

		if(istype(A, /obj))
			var/obj/O = A
			O.force = 0
			O.throwforce = 0

		if(istype(A, /obj/item/ammo_box))
			var/obj/item/ammo_box/AB = A
			for(var/obj/item/ammo_casing/R in AB.stored_ammo)
				qdel(R.BB)
				R.BB = new /obj/item/projectile/bullet/pisun
			return

		if(istype(A, /obj/item/gun/ballistic))
			var/obj/item/gun/ballistic/B = A
			if(B.magazine)
				for(var/obj/item/ammo_casing/R in B.magazine)
					qdel(R.BB)
					R.BB = new /obj/item/projectile/bullet/pisun
			return

		if(istype(A, /obj/item/gun/energy))
			var/obj/item/gun/energy/E = A
			E.ammo_type = list(/obj/item/ammo_casing/energy/pisun)
			return


/obj/item/projectile/bullet/pisun
	name = "leather bullet"
	damage = 0

/obj/item/ammo_casing/energy/pisun
	projectile_type = /obj/item/projectile/bullet/pisun
	e_cost = 50
	fire_sound = 'sound/weapons/taser2.ogg'
	harmful = FALSE

GLOBAL_LIST_INIT(pacifist_list, list("rebolution228"))