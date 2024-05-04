local global = {}

local saveStateKeys = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "0"}

function global.handleKeys(controller, key, dt)
    for i, v in ipairs(saveStateKeys) do
        if key == v and love.keyboard.isDown("z") then
            if G.STAGE == G.STAGES.RUN then
                compress_and_save(G.SETTINGS.profile .. '/' .. 'saveState' .. v .. '.jkr', G.ARGS.save_run)
            end
        end
        if key == v and love.keyboard.isDown("x") then
            G:delete_run()
            G.SAVED_GAME = get_compressed(G.SETTINGS.profile .. '/' .. 'saveState' .. v .. '.jkr')
            if G.SAVED_GAME ~= nil then
                G.SAVED_GAME = STR_UNPACK(G.SAVED_GAME)
            end
            G:start_run({
                savetext = G.SAVED_GAME
            })
        end
    end
end

return global