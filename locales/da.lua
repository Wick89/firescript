local Translations = {
    fire_deactivated = "Afmeld dig brandopkald!",
    fire_call = "Dit abonnerer på brandopkald!",
    test_coords = "ikke klar:",
    fire_menu = "ikke klar",
    admin_options_desc = "ikke klar",
    fire_length = "ikke klar",
    extra_sunny = "ikke klar",
    blips_for_fire = "ikke klar",
}

if GetConvar('qb_locale', 'en') == 'da' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
