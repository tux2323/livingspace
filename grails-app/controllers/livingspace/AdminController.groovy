package livingspace

class AdminController
{

    static layout = "bootstrap"

    def index()
    {
       [
               publicSignerList: Signer.findAllByUnlocked(false),
               publicSupporterList: Supporter.findAllByUnlocked(false)
       ]
    }

    def unlockSigner()
    {
        def signer = Signer.get(params.id)
        signer.unlocked = true
        signer.save(flush: true)
        chain(action: 'index', model: [unlockedSigner: signer])
    }

    def unlockSupporter()
    {
        def supporter = Supporter.get(params.id)
        supporter.unlocked = true
        supporter.save(flush: true)
        chain(action: 'index', model: [unlockedSupporter: supporter])
    }

}
